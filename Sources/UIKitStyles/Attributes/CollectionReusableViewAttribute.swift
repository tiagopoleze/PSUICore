#if os(iOS)
import UIKit

/// A collection reusable view attribute
public enum CollectionReusableViewAttribute: Attribute {
    /// The view attribute
    case view(ViewAttribute)

    /// The attribute value
    public var value: any Attribute {
        switch self {
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    /// Modify the view with the attribute
    /// - Parameter view: The view to modify
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}
#endif
