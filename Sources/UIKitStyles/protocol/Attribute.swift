#if os(iOS)
import UIKit

public protocol Attribute {
    associatedtype Value
    var value: Value { get }
    func modify<V: UIView>(view: V)
}

extension Attribute where Value: Attribute {
    func modify<V: UIView>(view: V) {
        value.modify(view: view)
    }
}
#endif
