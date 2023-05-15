#if os(iOS)
import UIKit

public extension UITableViewCell {
    convenience init(
        tableViewCellStyle: UITableViewCell.CellStyle,
        reuseIdentifier: String? = nil,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UITableViewCell) -> Void)? = nil
    ) {
        self.init(style: tableViewCellStyle, reuseIdentifier: reuseIdentifier)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }
}
#endif
