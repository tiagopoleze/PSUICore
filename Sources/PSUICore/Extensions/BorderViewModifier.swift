import SwiftUI

private struct RoundedBorderViewModifier: ViewModifier {
    let cornerRadius: CGFloat
    let color: Color
    let lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

public extension View {
    /// Adds a rounded border to this view.
    /// - Parameters:
    /// - cornerRadius: The radius of the rounded border.
    /// - color: The color of the rounded border. 
    /// - lineWidth: The width of the rounded border.
    /// - Returns: A new view with a rounded border.
    func roundedBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(RoundedBorderViewModifier(cornerRadius: cornerRadius, color: color, lineWidth: lineWidth))
    }
}

private struct RectangleBorderViewModifier: ViewModifier {
    let color: Color
    let lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

public extension View {
    /// Adds a rectangle border to this view.
    /// - Parameters:
    /// - cornerRadius: The radius of the rectangle border.
    /// - color: The color of the rectangle border.
    /// - lineWidth: The width of the rectangle border.
    /// - Returns: A new view with a rectangle border.
    func rectangleBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(RectangleBorderViewModifier(color: color, lineWidth: lineWidth))
    }
}

private struct CircleBorderViewModifier: ViewModifier {
    let color: Color
    let lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                Circle()
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

public extension View {
    /// Adds a circle border to this view.
    /// - Parameters:
    /// - cornerRadius: The radius of the circle border.
    /// - color: The color of the circle border.
    /// - lineWidth: The width of the circle border.
    /// - Returns: A new view with a circle border.
    func circleBorder(color: Color, lineWidth: CGFloat) -> some View {
        modifier(CircleBorderViewModifier(color: color, lineWidth: lineWidth))
    }
}
