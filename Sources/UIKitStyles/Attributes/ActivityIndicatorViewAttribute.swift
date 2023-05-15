#if os(iOS)
import UIKit

public enum ActivityIndicatorViewAttribute: Attribute {
    case hidesWhenStopped(Bool)
    case color(UIColor)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case .hidesWhenStopped(let value):
            return ActivityIndicatorHidesWhenStopped(value: value)
        case .color(let value):
            return ActivityIndicatorColor(value: value)
        case let .view(value):
            return value.value
        }
    }

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct ActivityIndicatorHidesWhenStopped: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let activityIndicator = view as? UIActivityIndicatorView else { return }
        activityIndicator.hidesWhenStopped = value
    }
}

public struct ActivityIndicatorColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let activityIndicator = view as? UIActivityIndicatorView else { return }
        activityIndicator.color = value
    }
}
#endif
