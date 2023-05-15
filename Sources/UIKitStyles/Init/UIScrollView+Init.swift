#if os(iOS)
import UIKit

public extension UIScrollView {
    convenience init(
        style: (any Style)? = nil,
        attributes: [ScrollViewAttribute] = [],
        additionalChanges: ((UIScrollView) -> Void)? = nil
    ) {
        self.init(style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
