import SwiftUI

/// A view that displays a shimmer effect.
public struct ShimmerConfig {
    /// The color of the shimmer effect.
    public var tint: Color
    /// The color of the highlight in the shimmer effect.
    public var highlight: Color
    /// The amount of blur applied to the shimmer effect. Default value is 5.
    public var blur: CGFloat
    /// The opacity of the highlight in the shimmer effect. Default value is 1.
    public var highlightOpacity: CGFloat
    /// The speed of the shimmer effect. Default value is 2.
    public var speed: CGFloat
    /// The blend mode used for the shimmer effect. Default value is .luminosity.
    public var blendMode: BlendMode

    /// Initializes a Shimmer effect with the specified parameters.
        ///
        /// - Parameters:
        ///   - tint: The color of the shimmer effect.
        ///   - highlight: The color of the highlight in the shimmer effect.
        ///   - blur: The amount of blur applied to the shimmer effect. Default value is 5.
        ///   - highlightOpacity: The opacity of the highlight in the shimmer effect. Default value is 1.
        ///   - speed: The speed of the shimmer effect. Default value is 2.
        ///   - blendMode: The blend mode used for the shimmer effect. Default value is .luminosity.
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

public extension View {
    /// Applies a shimmer effect to this view.
    /// - Parameter config: The shimmer effect configuration.
    /// - Returns: A view with a shimmer effect.
    @ViewBuilder func shimmer(_ config: ShimmerConfig) -> some View {
        self.modifier(ShimmerEffectHelper(config: config))
    }
}

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
                                        .offset(x: moveTo > 0 ? (geo.size.height / 2.5) : -(geo.size.height / 2.5))
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
struct ShimmerPreview: PreviewProvider {
    static var previews: some View {
        Text("Shimmer")
            .shimmer(.init(tint: .red, highlight: .blue))
    }
}
#endif
