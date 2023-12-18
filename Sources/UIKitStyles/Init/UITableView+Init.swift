#if os(iOS)
import UIKit

/// Convenience initializers for UITableView with customizable styles and attributes.
public extension UITableView {
    
    /// Initializes a UITableView with the specified style, frame, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - uiTableStyle: The style of the table view.
    ///   - frame: The frame rectangle for the table view, measured in points.
    ///   - style: The style to apply to the table view.
    ///   - attributes: An array of attributes to modify the table view.
    ///   - additionalChanges: A closure to perform additional changes to the table view.
    convenience init(
        uiTableStyle: UITableView.Style,
        frame: CGRect = .zero,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UITableView) -> Void)? = nil
    ) {
        self.init(frame: frame, style: uiTableStyle)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    /// Initializes a UITableView with the specified style, frame, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - uiTableStyle: The style of the table view.
    ///   - frame: The frame rectangle for the table view, measured in points.
    ///   - style: The style to apply to the table view.
    ///   - attributes: An array of attributes to modify the table view.
    ///   - additionalChanges: A closure to perform additional changes to the table view.
    convenience init(
        uiTableStyle: UITableView.Style,
        frame: CGRect = .zero,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [TableViewAttribute] = [],
        additionalChanges: ((UITableView) -> Void)? = nil
    ) {
        self.init(
            uiTableStyle: uiTableStyle,
            frame: frame,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }
}
#endif
