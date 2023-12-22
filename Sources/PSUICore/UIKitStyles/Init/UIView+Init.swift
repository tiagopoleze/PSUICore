#if os(iOS)
import UIKit

/// Convenience initializers for UIView with style and attributes.
public extension UIView {
    /// Initializes a UIView with the specified frame, style, attributes, and additional changes.
    /// - Parameters:
    /// - style: The style to be applied to the UIView.
    /// - attributes: An array of attributes to be applied to the UIView.
    /// - additionalChanges: A closure that allows for additional changes to be made to the UIView.
    convenience init<V: UIView>(
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((V) -> Void)? = nil
    ) {
        self.init()
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        if let self = self as? V {
            additionalChanges?(self)
        }
    }

    /// Initializes a UIView with the specified frame, style, attributes, and additional changes.
    /// - Parameters:
    /// - style: The style to be applied to the UIView.
    /// - attributes: An array of attributes to be applied to the UIView.
    /// - additionalChanges: A closure that allows for additional changes to be made to the UIView.
    convenience init<V: UIView>(
        style: (any Style)? = nil,
        attributes: [ViewAttribute] = [],
        additionalChanges: ((V) -> Void)? = nil
    ) {
        self.init(style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
