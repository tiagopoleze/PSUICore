#if os(iOS)
import UIKit

struct EmptyAttribute: Attribute {
    let value: () = Void()

    func modify<V>(view: V) where V: UIView { }
}
#endif
