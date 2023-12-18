#if os(iOS)
import UIKit

/// Convenience initializers for `UITableViewHeaderFooterView` with customizable styles and attributes.
public extension UITableViewHeaderFooterView {
    /// Initializes a `UITableViewHeaderFooterView` with the specified identifier, style, attributes, and additional changes.
    /// - Parameters:
    ///  - identifier: A string used to identify the header or footer view if it is to be reused by a UITableView.
    /// - style: The style to be applied to the `UITableViewHeaderFooterView`.
    /// - attributes: An array of attributes to be applied to the `UITableViewHeaderFooterView`.
    /// - additionalChanges: A closure that allows for additional changes to be made to the `UITableViewHeaderFooterView`.
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
