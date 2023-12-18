import SwiftUI

public extension View {
    /// Returns this view if the given condition evaluates to `true`, otherwise returns an empty view.
    /// - Parameters:
    /// - condition: A Boolean value that indicates whether to show this view.
    /// - Returns: This view if the given condition evaluates to `true`, otherwise an empty view.
    @ViewBuilder func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    /// A convenience method that conditionally applies different transformations to a view based on a boolean condition.
    /// - Parameters:
    /// - condition: The boolean condition that determines which transformation to apply.
    /// - transformIf: A closure that takes the view as input and returns the transformed view if the condition is true.
    /// - transformElse: A closure that takes the view as input and returns the transformed view if the condition is false.
    /// - Returns: A modified view based on the condition.
    /// - Note: This method is an extension on the `View` protocol.
    @ViewBuilder func `ifElse`<Content: View>(
        _ condition: Bool,
        transformIf: (Self) -> Content,
        transformElse: (Self) -> Content
    ) -> some View {
        if condition {
            transformIf(self)
        } else {
            transformElse(self)
        }
    }
}
