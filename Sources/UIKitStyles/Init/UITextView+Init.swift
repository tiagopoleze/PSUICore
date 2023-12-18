#if os(iOS)
import UIKit

/// Convenience initializers for UITextView with style and attributes.
public extension UITextView {
    /// Initializes a UITextView with the specified frame, style, attributes, and additional changes.
    /// - Parameters:
    /// - style: The style to be applied to the UITextView.
    /// - attributes: An array of attributes to be applied to the UITextView.
    /// - additionalChanges: A closure that allows for additional changes to be made to the UITextView.
    convenience init(
        style: (any Style)? = nil,
        attributes: [TextViewAttribute] = [],
        additionalChanges: ((UITextView) -> Void)? = nil
    ) {
        self.init(style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
