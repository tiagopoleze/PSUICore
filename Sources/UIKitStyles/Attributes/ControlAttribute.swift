//
//  ControlAttribute.swift
//  
//
//  Created by Tiago Ferreira on 08/05/2023.
//

#if os(iOS)
import UIKit

public enum ControlAttribute: Attribute {
    case isEnabled(Bool)
    case isSelected(Bool)
    case isHighlighted(Bool)
    case contentVerticalAlignment(UIControl.ContentVerticalAlignment)
    case contentHorizontalAlignment(UIControl.ContentHorizontalAlignment)
    case addTarget(ControlAddTargetValue)
    case removeTarget(ControlRemoveTargetValue)
    case isContextMenuInteractionEnabled(Bool)
    case showsMenuAsPrimaryAction(Bool)
    case toolTip(String)

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
            return ControlIsContextMenuInteractionEnabled(value: bool)
        case .showsMenuAsPrimaryAction(let bool):
            return ControlShowsMenuAsPrimaryAction(value: bool)
        case .toolTip(let string):
            return ControlToolTip(value: string)
        }
    }

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct ControlIsEnabled: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.isEnabled = value
    }
}

public struct ControlIsSelected: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.isSelected = value
    }
}

public struct ControlIsHighlighted: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.isHighlighted = value
    }
}
public struct ControlContentVerticalAlignment: Attribute {
    public let value: UIControl.ContentVerticalAlignment

    public init(value: UIControl.ContentVerticalAlignment) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.contentVerticalAlignment = value
    }
}

public struct ControlContentHorizontalAlignment: Attribute {
    public let value: UIControl.ContentHorizontalAlignment

    public init(value: UIControl.ContentHorizontalAlignment) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.contentHorizontalAlignment = value
    }
}

public struct ControlAddTargetValue {
    public let target: Any
    public let action: Selector
    public let event: UIControl.Event

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

public struct ControlAddTarget: Attribute {
    public let value: ControlAddTargetValue

    public init(value: ControlAddTargetValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.addTarget(value.target, action: value.action, for: value.event)
    }
}

public struct ControlRemoveTargetValue {
    public let target: Any
    public let action: Selector
    public let event: UIControl.Event

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

public struct ControlRemoveTarget: Attribute {
    public let value: ControlRemoveTargetValue

    public init(value: ControlRemoveTargetValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.removeTarget(value.target, action: value.action, for: value.event)
    }
}

public struct ControlIsContextMenuInteractionEnabled: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.isContextMenuInteractionEnabled = value
    }
}

public struct ControlShowsMenuAsPrimaryAction: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.showsMenuAsPrimaryAction = value
    }
}

public struct ControlToolTip: Attribute {
    public let value: String

    public init(value: String) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let control = view as? UIControl else { return }
        control.toolTip = value
    }
}
#endif
