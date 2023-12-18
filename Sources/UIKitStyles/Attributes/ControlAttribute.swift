#if os(iOS)
import UIKit

/// A control attribute.
public enum ControlAttribute: Attribute {
    /// The is enabled attribute.
    case isEnabled(Bool)
    /// The is selected attribute.
    case isSelected(Bool)
    /// The is highlighted attribute.
    case isHighlighted(Bool)
    /// The content vertical alignment attribute.
    case contentVerticalAlignment(UIControl.ContentVerticalAlignment)
    /// The content horizontal alignment attribute.
    case contentHorizontalAlignment(UIControl.ContentHorizontalAlignment)
    /// The add target attribute.
    case addTarget(ControlAddTargetValue)
    /// The remove target attribute.
    case removeTarget(ControlRemoveTargetValue)
    /// The is context menu interaction enabled attribute.
    case isContextMenuInteractionEnabled(Bool)
    /// The shows menu as primary action attribute.
    case showsMenuAsPrimaryAction(Bool)
    /// The tooltip attribute.
    case toolTip(String)

    /// The attribute value.
    public var value: any Attribute {
        switch self {
        case .isEnabled(let bool):
            return ControlIsEnabled(value: bool)
        case .isSelected(let bool):
            return ControlIsSelected(value: bool)
        case .isHighlighted(let bool):
            return ControlIsHighlighted(value: bool)
        case .contentVerticalAlignment(let contentVerticalAlignment):
            return ControlContentVerticalAlignment(value: contentVerticalAlignment)
        case .contentHorizontalAlignment(let contentHorizontalAlignment):
            return ControlContentHorizontalAlignment(value: contentHorizontalAlignment)
        case .addTarget(let controlAddTargetValue):
            return ControlAddTarget(value: controlAddTargetValue)
        case .removeTarget(let controlRemoveTargetValue):
            return ControlRemoveTarget(value: controlRemoveTargetValue)
        case .isContextMenuInteractionEnabled(let bool):
            if #available(iOS 14.0, *) {
                return ControlIsContextMenuInteractionEnabled(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .showsMenuAsPrimaryAction(let bool):
            if #available(iOS 14.0, *) {
                return ControlShowsMenuAsPrimaryAction(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .toolTip(let string):
            if #available(iOS 15.0, *) {
                return ControlToolTip(value: string)
            } else {
                return EmptyAttribute()
            }
        }
    }

    /// Modifies the specified view with the attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct representing the attribute for enabling or disabling a control.
public struct ControlIsEnabled: Attribute {
    /// The value indicating whether the control is enabled or disabled.
    public let value: Bool

    /// Initializes a new instance of the `ControlIsEnabled` struct.
    /// - Parameter value: The value indicating whether the control is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling it if it is a `UIControl`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.isEnabled = value
    }
}

/// A struct that represents the attribute for controlling the selection state of a UIControl.
public struct ControlIsSelected: Attribute {
    public let value: Bool

    /// Initializes a new instance of `ControlIsSelected`.
    /// - Parameter value: The boolean value indicating whether the control should be selected or not.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `isSelected` property to the provided value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.isSelected = value
    }
}

/// A struct representing the attribute for controlling the highlighted state of a control.
public struct ControlIsHighlighted: Attribute {
    /// The value indicating whether the control is highlighted or not.
    public let value: Bool

    /// Initializes a new instance of `ControlIsHighlighted`.
    /// - Parameter value: The value indicating whether the control is highlighted or not.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `isHighlighted` property to the provided value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.isHighlighted = value
    }
}
/// A struct that represents the vertical alignment of the content within a control.
public struct ControlContentVerticalAlignment: Attribute {
    /// The value of the vertical alignment.
    public let value: UIControl.ContentVerticalAlignment

    /// Initializes a `ControlContentVerticalAlignment` with the specified value.
    /// - Parameter value: The vertical alignment value.
    public init(value: UIControl.ContentVerticalAlignment) {
        self.value = value
    }

    /// Modifies the specified view by setting its content vertical alignment to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.contentVerticalAlignment = value
    }
}

/// A struct that represents the horizontal alignment of the content within a control.
public struct ControlContentHorizontalAlignment: Attribute {
    /// The value of the horizontal alignment.
    public let value: UIControl.ContentHorizontalAlignment

    /// Initializes a `ControlContentHorizontalAlignment` with the specified value.
    /// - Parameter value: The value of the horizontal alignment.
    public init(value: UIControl.ContentHorizontalAlignment) {
        self.value = value
    }

    /// Modifies the specified view by setting its content horizontal alignment to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.contentHorizontalAlignment = value
    }
}

/// Represents a value used to add a target-action pair to a control.
public struct ControlAddTargetValue {
    /// The target object that receives the action message.
    public let target: Any
    
    /// The selector that identifies the method to be called.
    public let action: Selector
    
    /// The control events for which the action message is sent.
    public let event: UIControl.Event

    /// Initializes a new instance of `ControlAddTargetValue`.
    ///
    /// - Parameters:
    ///   - target: The target object that receives the action message.
    ///   - action: The selector that identifies the method to be called.
    ///   - event: The control events for which the action message is sent.
    public init(
        target: Any,
        action: Selector,
        event: UIControl.Event
    ) {
        self.target = target
        self.action = action
        self.event = event
    }
}

/// A struct that represents an attribute for adding a target to a control.
public struct ControlAddTarget: Attribute {
    /// The value of the control add target attribute.
    public let value: ControlAddTargetValue

    /// Initializes a new instance of the `ControlAddTarget` struct.
    /// - Parameter value: The value of the control add target attribute.
    public init(value: ControlAddTargetValue) {
        self.value = value
    }

    /// Modifies the specified view by adding a target to the control.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.addTarget(value.target, action: value.action, for: value.event)
    }
}

/// Represents a value used to remove a target-action pair from a control.
public struct ControlRemoveTargetValue {
    /// The target object that the action message is sent to.
    public let target: Any
    
    /// The selector identifying the action method to be called.
    public let action: Selector
    
    /// The control events for which the action message is sent.
    public let event: UIControl.Event

    /// Initializes a new instance of `ControlRemoveTargetValue`.
    ///
    /// - Parameters:
    ///   - target: The target object that the action message is sent to.
    ///   - action: The selector identifying the action method to be called.
    ///   - event: The control events for which the action message is sent.
    public init(
        target: Any,
        action: Selector,
        event: UIControl.Event
    ) {
        self.target = target
        self.action = action
        self.event = event
    }
}

/// A struct that represents the removal of a target from a UIControl.
public struct ControlRemoveTarget: Attribute {
    /// The value that specifies the target, action, and event to be removed.
    public let value: ControlRemoveTargetValue

    /// Initializes a new instance of `ControlRemoveTarget`.
    /// - Parameter value: The value that specifies the target, action, and event to be removed.
    public init(value: ControlRemoveTargetValue) {
        self.value = value
    }

    /// Modifies the specified view by removing the target, action, and event specified in the `value`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.removeTarget(value.target, action: value.action, for: value.event)
    }
}

@available(iOS 14.0, *)
/// A struct representing an attribute that determines whether a control has context menu interaction enabled.
public struct ControlIsContextMenuInteractionEnabled: Attribute {
    /// The value indicating whether the control has context menu interaction enabled.
    public let value: Bool

    /// Initializes a new instance of `ControlIsContextMenuInteractionEnabled` with the specified value.
    /// - Parameter value: The value indicating whether the control has context menu interaction enabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `isContextMenuInteractionEnabled` property of the control to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.isContextMenuInteractionEnabled = value
    }
}

@available(iOS 14.0, *)
/// A struct representing an attribute that determines whether a control shows the menu as the primary action.
public struct ControlShowsMenuAsPrimaryAction: Attribute {
    /// The value indicating whether the control shows the menu as the primary action.
    public let value: Bool

    /// Initializes a new instance of `ControlShowsMenuAsPrimaryAction`.
    /// - Parameter value: The value indicating whether the control shows the menu as the primary action.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `showsMenuAsPrimaryAction` property of the control.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.showsMenuAsPrimaryAction = value
    }
}

@available(iOS 15.0, *)
/// A struct representing a tooltip attribute for a control.
public struct ControlToolTip: Attribute {
    /// The value of the tooltip.
    public let value: String

    /// Initializes a new instance of the `ControlToolTip` struct.
    /// - Parameter value: The value of the tooltip.
    public init(value: String) {
        self.value = value
    }

    /// Modifies the specified view by setting the tooltip value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let control = view as? UIControl else { return }
        control.toolTip = value
    }
}
#endif
