#if os(iOS)
import UIKit

/// Convenience initializers for UIScrollView with style and attributes.
public extension UIScrollView {
    /// Initializes a UIScrollView with the specified frame, style, attributes, and additional changes.
    /// - Parameters:
    ///  - frame: The frame rectangle for the scroll view, measured in points.
    /// - style: The style to be applied to the UIScrollView.
    /// - attributes: An array of attributes to be applied to the UIScrollView.
    /// - additionalChanges: A closure that allows for additional changes to be made to the UIScrollView.
    convenience init(
        style: (any Style)? = nil,
        attributes: [ScrollViewAttribute] = [],
        additionalChanges: ((UIScrollView) -> Void)? = nil
    ) {
        self.init(style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
