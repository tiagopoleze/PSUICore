#if os(iOS)
import UIKit

/// A protocol that defines a style for modifying a UIView.
public protocol Style {
    /// The associated attribute type.
    associatedtype StyleAttribute: Attribute
    /// The style's attributes.
    var attributes: [StyleAttribute] { get }
    
    /// Modifies the given view with the style's attributes.
    ///
    /// - Parameter view: The view to be modified.
    func modify<V: UIView>(view: V)
}

/// Extension of the `Style` protocol that provides a method to modify a UIView based on the defined attributes.
public extension Style {
    /// Modifies the given view by applying the attributes defined in the style.
    /// - Parameter view: The UIView to be modified.
    func modify<V: UIView>(view: V) {
        for attribute in attributes {
            attribute.modify(view: view)
        }
    }
}
#endif
