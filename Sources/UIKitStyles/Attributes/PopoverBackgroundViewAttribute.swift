#if os(iOS)
import UIKit

public enum PopoverBackgroundViewAttribute: Attribute {
    case arrowOffset(CGFloat)
    case arrowDirection(UIPopoverArrowDirection)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

public struct PopoverBackgroundViewArrowOffset: Attribute {
    public let value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let popover = view as? UIPopoverBackgroundView else { return }
        popover.arrowOffset = value
    }
}
public struct PopoverBackgroundViewArrowDirection: Attribute {
    public let value: UIPopoverArrowDirection

    public init(value: UIPopoverArrowDirection) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let popover = view as? UIPopoverBackgroundView else { return }
        popover.arrowDirection = value
    }
}
#endif
