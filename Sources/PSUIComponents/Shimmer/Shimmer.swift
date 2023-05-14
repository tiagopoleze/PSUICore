import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
public struct ShimmerConfig {
    public var tint: Color
    public var highlight: Color
    public var blur: CGFloat
    public var highlightOpacity: CGFloat
    public var speed: CGFloat
    public var blendMode: BlendMode

    public init(
        tint: Color,
        highlight: Color,
        blur: CGFloat = 5,
        highlightOpacity: CGFloat = 1,
        speed: CGFloat = 2,
        blendMode: BlendMode = .luminosity
    ) {
        self.tint = tint
        self.highlight = highlight
        self.blur = blur
        self.highlightOpacity = highlightOpacity
        self.speed = speed
        self.blendMode = blendMode
    }
}

@available(iOS 15.0, macOS 12.0, *)
public extension View {
    @ViewBuilder
    func shimmer(_ config: ShimmerConfig) -> some View {
        self.modifier(ShimmerEffectHelper(config: config))
    }
}

@available(iOS 15.0, macOS 12.0, *)
private struct ShimmerEffectHelper: ViewModifier {
    var config: ShimmerConfig
    var rotationDegree: Double = -70
    @State private var moveTo: CGFloat = -0.7

    func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .fill(config.tint)
                    .mask {
                        content
                    }
                    .overlay {
                        GeometryReader { geo in
                            Rectangle()
                                .fill(config.highlight)
                                .mask {
                                    Rectangle()
                                        .fill(
                                            .linearGradient(colors: [
                                                .white.opacity(0),
                                                config.highlight.opacity(config.highlightOpacity),
                                                .white.opacity(0)
                                            ], startPoint: .top, endPoint: .bottom)
                                        )
                                        .blur(radius: config.blur)
                                        .rotationEffect(.degrees(rotationDegree))
                                        .offset(x: moveTo > 0 ? (geo.size.height / 2.5) :   -(geo.size.height / 2.5))
                                        .offset(x: geo.size.width * moveTo)
                                }
                                .blendMode(config.blendMode)
                        }
                        .mask {
                            content
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            moveTo = 0.7
                        }
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
}

#if DEBUG
@available(iOS 15.0, macOS 12.0, *)
struct ShimmerPreview: PreviewProvider {
    static var previews: some View {
        Text("Shimmer")
            .shimmer(.init(tint: .red, highlight: .blue))
    }
}
#endif
