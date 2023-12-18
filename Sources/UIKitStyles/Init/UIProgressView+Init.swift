#if os(iOS)
import UIKit

/// Convenience initializers for UIProgressView with customizable styles and attributes.
public extension UIProgressView {
    
    /// Initializes a UIProgressView with the specified progress view style, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - progressViewStyle: The style of the progress view.
    ///   - style: The custom style to apply to the progress view.
    ///   - attributes: An array of attributes to modify the progress view.
    ///   - additionalChanges: Additional changes to apply to the progress view.
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

    /// Initializes a UIProgressView with the specified progress view style, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - progressViewStyle: The style of the progress view.
    ///   - style: The custom style to apply to the progress view.
    ///   - attributes: An array of attributes to modify the progress view.
    ///   - additionalChanges: Additional changes to apply to the progress view.
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
