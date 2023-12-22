#if os(iOS)
import UIKit

/// Convenience initializers for UIImageView with style and attributes.
public extension UIImageView {
    
    /// Initializes a UIImageView with an image, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - image: The image to be displayed in the UIImageView.
    ///   - style: The style to be applied to the UIImageView.
    ///   - attributes: An array of attributes to be applied to the UIImageView.
    ///   - additionalChanges: A closure that allows for additional changes to be made to the UIImageView.
    convenience init(
        image: UIImage?,
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIImageView) -> Void)? = nil
    ) {
        self.init(image: image)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    /// Initializes a UIImageView with an image, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - image: The image to be displayed in the UIImageView.
    ///   - style: The style to be applied to the UIImageView.
    ///   - attributes: An array of ImageViewAttribute to be applied to the UIImageView.
    ///   - additionalChanges: A closure that allows for additional changes to be made to the UIImageView.
    convenience init(
        image: UIImage?,
        style: (any Style)? = nil,
        attributes: [ImageViewAttribute] = [],
        additionalChanges: ((UIImageView) -> Void)? = nil
    ) {
        self.init(image: image, style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
