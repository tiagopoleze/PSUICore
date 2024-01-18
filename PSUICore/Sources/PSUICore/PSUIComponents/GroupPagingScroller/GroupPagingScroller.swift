#if os(iOS)
import SwiftUI

struct GroupPagingScroller<Content: View, T: Identifiable> {
    var content: (T) -> Content
    var list: [T]
    var trailingSpace: CGFloat
    
    @Binding var index: Int
    @GestureState var offset: CGFloat = 0
    @State private var currentIndex: Int = 0
    @EnvironmentObject private var designSystem: DesignSystem
    
    init(trailingSpace: CGFloat = 50, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.list = items
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
}

extension GroupPagingScroller: View {
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width - (trailingSpace - designSystem.spacer.lg)
            let adjustedWidth = (trailingSpace / 2) - designSystem.spacer.lg

            HStack(spacing: designSystem.spacer.lg) {
                ForEach(list) { item in content(item).frame(width: abs(geo.size.width - trailingSpace)) }
            }
            .padding(.horizontal, designSystem.spacer.lg)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustedWidth : 0) + offset)
            .gesture(
                DragGesture()
                    .updating($offset) { value, out, _ in
                        out = value.translation.width
                    }
                    .onEnded { value in
                        let offsetX = value.translation.width

                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()

                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        currentIndex = index
                    }
                    .onChanged { value in
                        let offsetX = value.translation.width

                        let progress = -offsetX / width
                        let roundIndex = progress.rounded()

                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                    }
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }
}

private struct Person: Identifiable {
    var id: String { name }
    let name: String
}

struct GroupPagingScrollerPreview: PreviewProvider {
    static var previews: some View {
        GroupPagingScroller(
            index: .constant(1),
            items: [
                Person(name: "Tiago"),
                .init(name: "Isabele"),
                .init(name: "Talita")
            ]
        ) { person in
            PSButton(title: person.name)
        }
        .environmentObject(DesignSystem.mock)
    }
}
#endif
