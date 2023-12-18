#if os(iOS)
import UIKit

/// An activity indicator view attribute.
public enum ActivityIndicatorViewAttribute: Attribute {
    /// The hides when stopped attribute.
    case hidesWhenStopped(Bool)
    /// The color attribute.
    case color(UIColor)
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute value.
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

    /// Modifies the view with the attribute.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct that represents an attribute for hiding the activity indicator when it is stopped.
public struct ActivityIndicatorHidesWhenStopped: Attribute {
    /// The value indicating whether the activity indicator should be hidden when it is stopped.
    public var value: Bool

    /// Initializes a new instance of the `ActivityIndicatorHidesWhenStopped` struct.
    /// - Parameter value: The value indicating whether the activity indicator should be hidden when it is stopped.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `hidesWhenStopped` property of the activity indicator.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let activityIndicator = view as? UIActivityIndicatorView else { return }
        activityIndicator.hidesWhenStopped = value
    }
}
/// A struct representing the color attribute for an activity indicator view.
public struct ActivityIndicatorColor: Attribute {
    public var value: UIColor

    /// Initializes a new instance of `ActivityIndicatorColor` with the specified color value.
    /// - Parameter value: The color value for the activity indicator.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the color of the activity indicator.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let activityIndicator = view as? UIActivityIndicatorView else { return }
        activityIndicator.color = value
    }
}
#endif
