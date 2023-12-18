#if os(iOS)
import UIKit

/// Convenience initializers for `UIActivityIndicatorView` with customizable styles and attributes.
public extension UIActivityIndicatorView {
    
    /// Initializes a `UIActivityIndicatorView` with the specified activity indicator style, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - activityIndicatorStyle: The style of the activity indicator view.
    ///   - style: The custom style to apply to the activity indicator view.
    ///   - attributes: An array of attributes to modify the activity indicator view.
    ///   - additionalChanges: Additional changes to apply to the activity indicator view.
    convenience init(
        activityIndicatorStyle: UIActivityIndicatorView.Style,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIActivityIndicatorView) -> Void)? = nil
    ) {
        self.init(style: activityIndicatorStyle)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    /// Initializes a `UIActivityIndicatorView` with the specified activity indicator style, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - activityIndicatorStyle: The style of the activity indicator view.
    ///   - style: The custom style to apply to the activity indicator view.
    ///   - attributes: An array of attributes to modify the activity indicator view.
    ///   - additionalChanges: Additional changes to apply to the activity indicator view.
    convenience init(
        activityIndicatorStyle: UIActivityIndicatorView.Style,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [ActivityIndicatorViewAttribute] = [],
        additionalChanges: ((UIActivityIndicatorView) -> Void)? = nil
    ) {
        self.init(
            activityIndicatorStyle: activityIndicatorStyle,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }
}
#endif
