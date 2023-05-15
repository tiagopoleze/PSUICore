#if os(iOS)
import UIKit

public extension UIProgressView {
    convenience init(
        progressViewStyle: UIProgressView.Style,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIProgressView) -> Void)? = nil
    ) {
        self.init(progressViewStyle: progressViewStyle)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    convenience init(
        progressViewStyle: UIProgressView.Style,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [ProgressViewAttribute] = [],
        additionalChanges: ((UIProgressView) -> Void)? = nil
    ) {
        self.init(
            progressViewStyle: progressViewStyle,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }
}
#endif
