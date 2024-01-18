#if os(iOS)
import UIKit

/// Enum that represents the attributes for a list content view.
public enum ListContentViewAttribute: Attribute {
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute type.
    public var value: any Attribute {
        switch self {
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    /// Modifies the provided view by applying the attribute to a UILabel.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}
#endif
