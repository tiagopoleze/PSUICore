import SwiftUI
import PSUICore

@available(iOS 15.0, macOS 12.0, *)
public enum PSButtonStyle {
    case primary
    case secondary
    case tertiary
    case success
    case danger

    func tintColor(
        colorScheme: ColorScheme,
        disable: Binding<Bool>
    ) -> Color {
        switch self {
        case .primary, .success, .danger:
            let enableColor = Color.white
            let disableColor = Color.white.opacity(0.5)
            return disable.wrappedValue ? disableColor : enableColor
        case .secondary, .tertiary:
            let enableColor = Color.primaryPS(colorScheme)
            let disableColor = Color.primaryPS(colorScheme).opacity(0.5)
            return disable.wrappedValue ? disableColor : enableColor
        }
    }

    @ViewBuilder func background(
        colorScheme: ColorScheme,
        cornerRadius: CGFloat,
        disable: Binding<Bool>
    ) -> some View {
        switch self {
        case .primary:
            let enableColor = Color.primaryPS(colorScheme)
            let disableColor = Color.primaryPS(colorScheme).opacity(0.5)
            createRoundedRectangle(
                cornerRadius: cornerRadius,
                backgroundColor: disable.wrappedValue ? disableColor : enableColor)
        case .secondary, .tertiary:
            let enableColor = Color.primaryPS(colorScheme)
            let disableColor = Color.primaryPS(colorScheme).opacity(0.5)
            createRoundedRectangle(
                cornerRadius: cornerRadius,
                backgroundColor: disable.wrappedValue ? .gray.opacity(0.7) : .white.opacity(0.001))
            .if(.secondary == self, transform: {
                $0.roundedBorder(
                    cornerRadius: cornerRadius,
                    color: disable.wrappedValue ? disableColor : enableColor,
                    lineWidth: 3)
            })
        case .success:
            let enableColor = Color.successPS(colorScheme)
            let disableColor = Color.successPS(colorScheme).opacity(0.5)
            createRoundedRectangle(
                cornerRadius: cornerRadius,
                backgroundColor: disable.wrappedValue ? disableColor : enableColor)
        case .danger:
            let enableColor = Color.dangerPS(colorScheme)
            let disableColor = Color.dangerPS(colorScheme).opacity(0.5)
            createRoundedRectangle(
                cornerRadius: cornerRadius,
                backgroundColor: disable.wrappedValue ? disableColor : enableColor)
        }
    }

    @ViewBuilder private func createRoundedRectangle(
        cornerRadius: CGFloat,
        backgroundColor: Color
    ) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .foregroundColor(backgroundColor)
    }
}
