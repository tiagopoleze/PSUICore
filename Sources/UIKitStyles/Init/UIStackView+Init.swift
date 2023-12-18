#if os(iOS)
import UIKit

/// Convenience initializers for UIStackView with support for styling and attributes.
public extension UIStackView {
    
    /// Initializes a UIStackView with arranged subviews, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - arrangedSubviews: An array of UIViews to be arranged in the stack view.
    ///   - style: An optional style to be applied to the stack view.
    ///   - attributes: An array of attributes to be applied to the stack view.
    ///   - additionalChanges: An optional closure to perform additional changes to the stack view.
    convenience init(
        arrangedSubviews: [UIView] = [],
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIStackView) -> Void)? = nil
    ) {
        self.init(arrangedSubviews: arrangedSubviews)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    /// Initializes a UIStackView with arranged subviews, style, stack view attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - arrangedSubviews: An array of UIViews to be arranged in the stack view.
    ///   - style: An optional style to be applied to the stack view.
    ///   - attributes: An array of stack view attributes to be applied to the stack view.
    ///   - additionalChanges: An optional closure to perform additional changes to the stack view.
    convenience init(
        arrangedSubviews: [UIView] = [],
        style: (any Style)? = nil,
        attributes: [StackViewAttribute] = [],
        additionalChanges: ((UIStackView) -> Void)? = nil
    ) {
        self.init(
            arrangedSubviews: arrangedSubviews,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }
}
#endif
