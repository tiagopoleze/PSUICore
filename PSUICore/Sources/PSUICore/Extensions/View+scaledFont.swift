#if os(iOS)
import SwiftUI

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    public func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

@available(iOS 13.0, macOS 10.15, *)
public extension View {
    /// Returns a view with a custom font.
    /// - Parameters:
    /// - font: The name of the font.
    /// - size: The size of the font.
    /// - Returns: A view with a custom font.
    func custom(font: String, size: CGFloat) -> some View {
        return scaledFont(name: font, size: size)
    }

    private func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
#endif
