#if os(iOS)
import UIKit

/// An event attribution view attribute.
public enum EventAttributionViewAttribute: Attribute {
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute value.
    public var value: any Attribute {
        switch self {
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    /// Modifies the view with the attribute.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}
#endif
