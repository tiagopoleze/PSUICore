import SwiftUI

@available(iOS 13.0, *)
struct GroupPagingScroller<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    var spacing: CGFloat
    var trailingSpace: CGFloat

    @Binding var index: Int
    @GestureState var offset: CGFloat = 0
    @State private var currentIndex: Int = 0

    init(
        spacing: CGFloat = 15,
        trailingSpace: CGFloat = 50,
        index: Binding<Int>,
        items: [T],
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }

    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width - (trailingSpace - spacing)
            let adjustedWidth = (trailingSpace / 2) - spacing

            HStack(spacing: spacing) {
                ForEach(list) { item in content(item).frame(width: abs(geo.size.width - trailingSpace)) }
            }
            .padding(.horizontal, spacing)
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

#if DEBUG
private struct Person: Identifiable {
    var id: String { name }
    let name: String
}

@available(iOS 15.0, macOS 12.0, *)
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
    }
}
#endif
