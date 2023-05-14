#if os(iOS)
import UIKit

public enum EventAttributionViewAttribute: Attribute {
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}
#endif
