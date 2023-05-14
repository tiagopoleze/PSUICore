#if os(iOS)
import UIKit

public extension UIImageView {
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
