#if os(iOS)
import UIKit

/// Convenience initializers for UILabel with customizable text, style, attributes, and additional changes.
public extension UILabel {
    
    /// Initializes a UILabel with the specified text, style, attributes, and additional changes.
    /// - Parameters:
    ///   - text: The text to be displayed in the label.
    ///   - style: The style to be applied to the label.
    ///   - attributes: An array of attributes to be applied to the label.
    ///   - additionalChanges: A closure that allows for additional custom changes to be made to the label.
    convenience init(
        text: String?,
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UILabel) -> Void)? = nil
    ) {
        self.init()
        self.text = text
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    /// Initializes a UILabel with the specified text, style, attributes, and additional changes.
    /// - Parameters:
    ///   - text: The text to be displayed in the label.
    ///   - style: The style to be applied to the label.
    ///   - attributes: An array of label attributes to be applied to the label.
    ///   - additionalChanges: A closure that allows for additional custom changes to be made to the label.
    convenience init(
        text: String?,
        style: (any Style)? = nil,
        attributes: [LabelAttribute] = [],
        additionalChanges: ((UILabel) -> Void)? = nil
    ) {
        self.init(text: text, style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
