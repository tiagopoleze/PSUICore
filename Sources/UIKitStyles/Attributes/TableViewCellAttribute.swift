#if os(iOS)
import UIKit

public enum TableViewCellAttribute: Attribute {
    // swiftlint:disable:next identifier_name
    case automaticallyUpdatesBackgroundConfiguration(Bool)
    case backgroundView(UIView)
    case selectedBackgroundView(UIView)
    case multipleSelectionBackgroundView(UIView)
    case selectionStyle(UITableViewCell.SelectionStyle)
    case userInteractionEnabledWhileDragging(Bool)
    case isSelected(Bool)
    case isHighlighted(Bool)
    case showsReorderControl(Bool)
    case shouldIndentWhileEditing(Bool)
    case accessoryType(UITableViewCell.AccessoryType)
    case accessoryView(UIView)
    case editingAccessoryType(UITableViewCell.AccessoryType)
    case editingAccessoryView(UIView)
    case indentationLevel(Int)
    case indentationWidth(CGFloat)
    case separatorInset(UIEdgeInsets)
    case isEditing(Bool)
    case focusStyle(UITableViewCell.FocusStyle)

    case view(ViewAttribute)
    public var value: any Attribute {
        switch self {
        case .automaticallyUpdatesBackgroundConfiguration(let bool):
            if #available(iOS 14.0, *) {
                return TableViewCellAutomaticallyUpdatesBackgroundConfiguration(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .backgroundView(let uIView):
            return TableViewCellBackgroundView(value: uIView)
        case .selectedBackgroundView(let uIView):
            return TableViewCellBackgroundView(value: uIView)
        case .multipleSelectionBackgroundView(let uIView):
            return TableViewCellMultipleSelectionBackgroundView(value: uIView)
        case .selectionStyle(let selectionStyle):
            return TableViewCellSelectionStyle(value: selectionStyle)
        case .userInteractionEnabledWhileDragging(let bool):
            return TableViewCellUserInteractionEnabledWhileDragging(value: bool)
        case .isSelected(let bool):
            return TableViewCellIsSelected(value: bool)
        case .isHighlighted(let bool):
            return TableViewCellIsHighlighted(value: bool)
        case .showsReorderControl(let bool):
            return TableViewCellShowsReorderControl(value: bool)
        case .shouldIndentWhileEditing(let bool):
            return TableViewCellShouldIndentWhileEditing(value: bool)
        case .accessoryType(let accessoryType):
            return TableViewCellAccessoryType(value: accessoryType)
        case .accessoryView(let uIView):
            return TableViewCellAccessoryView(value: uIView)
        case .editingAccessoryType(let accessoryType):
            return TableViewCellEditingAccessoryType(value: accessoryType)
        case .editingAccessoryView(let uIView):
            return TableViewCellEditingAccessoryView(value: uIView)
        case .indentationLevel(let int):
            return TableViewCellIndentationLevel(value: int)
        case .indentationWidth(let cGFloat):
            return TableViewCellIndentationWidth(value: cGFloat)
        case .separatorInset(let uIEdgeInsets):
            return TableViewCellSeparatorInset(value: uIEdgeInsets)
        case .isEditing(let bool):
            return TableViewCellIsEditing(value: bool)
        case .focusStyle(let focusStyle):
            return TableViewCellFocusStyle(value: focusStyle)
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

@available(iOS 14.0, *)
// swiftlint:disable:next type_name
public struct TableViewCellAutomaticallyUpdatesBackgroundConfiguration: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.automaticallyUpdatesBackgroundConfiguration = value
    }
}
public struct TableViewCellBackgroundView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.backgroundView = value
    }
}
public struct TableViewCellSelectedBackgroundView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.selectedBackgroundView = value
    }
}

// swiftlint:disable:next type_name
public struct TableViewCellMultipleSelectionBackgroundView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.multipleSelectionBackgroundView = value
    }
}
public struct TableViewCellSelectionStyle: Attribute {
    public var value: UITableViewCell.SelectionStyle

    public init(value: UITableViewCell.SelectionStyle) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.selectionStyle = value
    }
}

// swiftlint:disable:next type_name
public struct TableViewCellUserInteractionEnabledWhileDragging: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.userInteractionEnabledWhileDragging = value
    }
}
public struct TableViewCellIsSelected: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.isSelected = value
    }
}
public struct TableViewCellIsHighlighted: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.isHighlighted = value
    }
}
public struct TableViewCellShowsReorderControl: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.showsReorderControl = value
    }
}
public struct TableViewCellShouldIndentWhileEditing: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.shouldIndentWhileEditing = value
    }
}
public struct TableViewCellAccessoryType: Attribute {
    public var value: UITableViewCell.AccessoryType

    public init(value: UITableViewCell.AccessoryType) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.accessoryType = value
    }
}
public struct TableViewCellAccessoryView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.accessoryView = value
    }
}
public struct TableViewCellEditingAccessoryType: Attribute {
    public var value: UITableViewCell.AccessoryType

    public init(value: UITableViewCell.AccessoryType) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.editingAccessoryType = value
    }
}
public struct TableViewCellEditingAccessoryView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.editingAccessoryView = value
    }
}
public struct TableViewCellIndentationLevel: Attribute {
    public var value: Int

    public init(value: Int) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.indentationLevel = value
    }
}
public struct TableViewCellIndentationWidth: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.indentationWidth = value
    }
}
public struct TableViewCellSeparatorInset: Attribute {
    public var value: UIEdgeInsets

    public init(value: UIEdgeInsets) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.separatorInset = value
    }
}
public struct TableViewCellIsEditing: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.isEditing = value
    }
}
public struct TableViewCellFocusStyle: Attribute {
    public var value: UITableViewCell.FocusStyle

    public init(value: UITableViewCell.FocusStyle) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.focusStyle = value
    }
}
#endif
