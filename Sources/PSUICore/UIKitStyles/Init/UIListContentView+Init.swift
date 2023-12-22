#if os(iOS)
import UIKit

@available(iOS 14.0, *)
/// Convenience initializers for UIListContentView with style and attributes.
public extension UIListContentView {
    /// Initializes a UIListContentView with the specified configuration, style, attributes, and additional changes.
    /// - Parameters:
    ///  - configuration: The configuration object to use for the list content view.
    /// - style: The style to be applied to the UIListContentView.
    /// - attributes: An array of attributes to be applied to the UIListContentView.
    /// - additionalChanges: A closure that allows for additional changes to be made to the UIListContentView.
    convenience init(
        configuration: UIListContentConfiguration,
        style: (any PSUICore.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIListContentView) -> Void)? = nil
    ) {
        self.init(configuration: configuration)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }
}
#endif
