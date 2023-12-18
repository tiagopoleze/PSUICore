#if os(iOS)
import UIKit

/// Convenience initializers for UITableViewCell with style and attributes.
public extension UITableViewCell {
    /// Initializes a UITableViewCell with the specified style, reuseIdentifier, style, attributes, and additional changes.
    /// - Parameters:
    /// - tableViewCellStyle: A constant indicating a cell style.
    /// - reuseIdentifier: A string used to identify the cell object if it is to be reused for drawing multiple rows of a table view.
    /// - style: The style to be applied to the UITableViewCell.
    /// - attributes: An array of attributes to be applied to the UITableViewCell.
    /// - additionalChanges: A closure that allows for additional changes to be made to the UITableViewCell.
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
