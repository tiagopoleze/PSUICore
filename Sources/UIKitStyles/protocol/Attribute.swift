#if os(iOS)
import UIKit

/// A protocol that represents an attribute.
public protocol Attribute {
    /// The associated value type.
    associatedtype Value
    /// The attribute's value.
    var value: Value { get }
    
    /// Modifies the specified view based on the attribute's value.
    ///
    /// - Parameter view: The view to be modified.
    func modify<V: UIView>(view: V)
}

extension Attribute where Value: Attribute {
    /// Modifies the specified view based on the attribute's value.
    ///
    /// - Parameter view: The view to be modified.
    func modify<V: UIView>(view: V) {
        value.modify(view: view)
    }
}
#endif
