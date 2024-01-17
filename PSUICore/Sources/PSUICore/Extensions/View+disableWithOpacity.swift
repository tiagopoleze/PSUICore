import SwiftUI

public extension View {
    /// Disables this view and sets its opacity to the specified value when the specified condition is true.
    /// - Parameters:
    /// - condition: A Boolean value that indicates whether this view should be disabled.
    /// - opacity: The opacity to use when this view is disabled.
    /// - Returns: A new view that is disabled when the specified condition is true.
    func disableWithOpacity(_ condition: Bool, opacity: CGFloat = 0.6) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? opacity : 1)
    }
}
