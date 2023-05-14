#if os(iOS)
import UIKit

public extension UITextView {
    convenience init(
        style: (any Style)? = nil,
        attributes: [TextViewAttribute] = [],
        additionalChanges: ((UITextView) -> Void)? = nil
    ) {
        self.init(style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
