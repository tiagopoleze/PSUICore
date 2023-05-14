#if os(iOS)
import UIKit

public extension UITableViewHeaderFooterView {
    convenience init(
        identifier: String?,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UITableViewHeaderFooterView) -> Void)? = nil
    ) {
        self.init(reuseIdentifier: identifier)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }
}
#endif
