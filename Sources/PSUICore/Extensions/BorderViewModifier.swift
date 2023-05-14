import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
private struct RoundedBorderViewModifier: ViewModifier {
    let cornerRadius: CGFloat
    let color: Color
    let lineWidth: CGFloat

    init(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) {
        self.cornerRadius = cornerRadius
        self.color = color
        self.lineWidth = lineWidth
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

@available(iOS 13.0, macOS 10.15, *)
public extension View {
    func roundedBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(RoundedBorderViewModifier(cornerRadius: cornerRadius, color: color, lineWidth: lineWidth))
    }
}

@available(iOS 13.0, macOS 10.15, *)
private struct RectangleBorderViewModifier: ViewModifier {
    let color: Color
    let lineWidth: CGFloat

    init(color: Color, lineWidth: CGFloat) {
        self.color = color
        self.lineWidth = lineWidth
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

@available(iOS 13.0, macOS 10.15, *)
public extension View {
    func rectangleBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(RectangleBorderViewModifier(color: color, lineWidth: lineWidth))
    }
}

@available(iOS 13.0, macOS 10.15, *)
private struct CircleBorderViewModifier: ViewModifier {
    let color: Color
    let lineWidth: CGFloat

    init(color: Color, lineWidth: CGFloat) {
        self.color = color
        self.lineWidth = lineWidth
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                Circle()
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

@available(iOS 13.0, macOS 10.15, *)
public extension View {
    func circleBorder(color: Color, lineWidth: CGFloat) -> some View {
        modifier(CircleBorderViewModifier(color: color, lineWidth: lineWidth))
    }
}
