#if os(iOS)
import UIKit

/// Enum that represents the attributes for a popover background view.
public enum PopoverBackgroundViewAttribute: Attribute {
    /// The arrow offset value.
    case arrowOffset(CGFloat)
    /// The arrow direction value.
    case arrowDirection(UIPopoverArrowDirection)
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute type.
    public var value: any Attribute {
        switch self {
        case .arrowOffset(let cGFloat):
            return PopoverBackgroundViewArrowOffset(value: cGFloat)
        case .arrowDirection(let uIPopoverArrowDirection):
            return PopoverBackgroundViewArrowDirection(value: uIPopoverArrowDirection)
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

/// A struct representing the arrow offset attribute for a popover background view.
public struct PopoverBackgroundViewArrowOffset: Attribute {
    /// The value of the arrow offset.
    public let value: CGFloat

    /// Initializes a new instance of `PopoverBackgroundViewArrowOffset`.
    /// - Parameter value: The value of the arrow offset.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting the arrow offset of the popover background view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let popover = view as? UIPopoverBackgroundView else { return }
        popover.arrowOffset = value
    }
}
/// A struct that represents an attribute for the arrow direction of a popover background view.
public struct PopoverBackgroundViewArrowDirection: Attribute {
    /// The value of the arrow direction.
    public let value: UIPopoverArrowDirection

    /// Initializes a new instance of `PopoverBackgroundViewArrowDirection`.
    /// - Parameter value: The value of the arrow direction.
    public init(value: UIPopoverArrowDirection) {
        self.value = value
    }

    /// Modifies the specified view by setting its arrow direction to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let popover = view as? UIPopoverBackgroundView else { return }
        popover.arrowDirection = value
    }
}
#endif
