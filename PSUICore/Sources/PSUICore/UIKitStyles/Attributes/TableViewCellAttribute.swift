#if os(iOS)
import UIKit

/// A Enum that represents the attributes for a UITableViewCell.
public enum TableViewCellAttribute: Attribute {
    /// A Boolean value indicating whether the background configuration of the table view cell should be automatically updated.
    case automaticallyUpdatesBackgroundConfiguration(Bool)
    /// The background view of the table view cell.
    case backgroundView(UIView)
    /// The selected background view of the table view cell.
    case selectedBackgroundView(UIView)
    /// The multiple selection background view of the table view cell.
    case multipleSelectionBackgroundView(UIView)
    /// The selection style of the table view cell.
    case selectionStyle(UITableViewCell.SelectionStyle)
    /// A Boolean value indicating whether user interaction is enabled on the table view cell while dragging.
    case userInteractionEnabledWhileDragging(Bool)
    /// A Boolean value indicating whether the table view cell is selected.
    case isSelected(Bool)
    /// A Boolean value indicating whether the table view cell is highlighted.
    case isHighlighted(Bool)
    /// A Boolean value indicating whether the table view cell shows the reorder control.
    case showsReorderControl(Bool)
    /// A Boolean value indicating whether the table view cell should indent while editing.
    case shouldIndentWhileEditing(Bool)
    /// The accessory type of the table view cell.
    case accessoryType(UITableViewCell.AccessoryType)
    /// The accessory view of the table view cell.
    case accessoryView(UIView)
    /// The editing accessory type of the table view cell.
    case editingAccessoryType(UITableViewCell.AccessoryType)
    /// The editing accessory view of the table view cell.
    case editingAccessoryView(UIView)
    /// The indentation level of the table view cell.
    case indentationLevel(Int)
    /// The indentation width of the table view cell.
    case indentationWidth(CGFloat)
    /// The separator inset of the table view cell.
    case separatorInset(UIEdgeInsets)
    /// A Boolean value indicating whether the table view cell is editing.
    case isEditing(Bool)
    /// The focus style of the table view cell.
    case focusStyle(UITableViewCell.FocusStyle)
    /// A view attribute that represents the view to be modified.
    case view(ViewAttribute)

    /// The value of the attribute.
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

    /// Modifies the given view by applying the specified attribute.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for automatically updating the background configuration of a table view cell.
public struct TableViewCellAutomaticallyUpdatesBackgroundConfiguration: Attribute {
    /// The value indicating whether the background configuration of the table view cell should be automatically updated.
    public var value: Bool

    /// Initializes a new instance of the `TableViewCellAutomaticallyUpdatesBackgroundConfiguration` struct.
    /// - Parameter value: The value indicating whether the background configuration of the table view cell should be automatically updated.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `automaticallyUpdatesBackgroundConfiguration` property of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.automaticallyUpdatesBackgroundConfiguration = value
    }
}
/// A struct that represents an attribute for configuring the background view of a table view cell.
public struct TableViewCellBackgroundView: Attribute {
    public var value: UIView

    /// Initializes a `TableViewCellBackgroundView` with the specified background view.
    /// - Parameter value: The background view to be set for the table view cell.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the specified view by setting its background view to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.backgroundView = value
    }
}
/// A struct that represents an attribute for configuring the selected background view of a table view cell.
public struct TableViewCellSelectedBackgroundView: Attribute {
    public var value: UIView

    /// Initializes a new instance of the `TableViewCellSelectedBackgroundView` struct.
    /// - Parameter value: The view to be set as the selected background view of the table view cell.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the provided view by setting the selected background view of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.selectedBackgroundView = value
    }
}

/// A struct that represents an attribute for customizing the multiple selection background view of a table view cell.
public struct TableViewCellMultipleSelectionBackgroundView: Attribute {
    public var value: UIView

    /// Initializes a new instance of the `TableViewCellMultipleSelectionBackgroundView` struct.
    /// - Parameter value: The custom view to be set as the multiple selection background view.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the provided view by setting the multiple selection background view to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.multipleSelectionBackgroundView = value
    }
}
/// A struct that represents the selection style of a table view cell.
public struct TableViewCellSelectionStyle: Attribute {
    /// The value of the selection style.
    public var value: UITableViewCell.SelectionStyle

    /// Initializes a new instance of the TableViewCellSelectionStyle struct.
    /// - Parameter value: The selection style value.
    public init(value: UITableViewCell.SelectionStyle) {
        self.value = value
    }

    /// Modifies the given view by setting its selection style to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.selectionStyle = value
    }
}

/// A struct representing an attribute that determines whether user interaction is enabled on a table view cell while dragging.
public struct TableViewCellUserInteractionEnabledWhileDragging: Attribute {
    /// The value indicating whether user interaction is enabled while dragging.
    public var value: Bool

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value indicating whether user interaction is enabled while dragging.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `userInteractionEnabledWhileDragging` property of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.userInteractionEnabledWhileDragging = value
    }
}
/// A struct that represents an attribute for setting the selection state of a table view cell.
public struct TableViewCellIsSelected: Attribute {
    /// The value indicating whether the table view cell should be selected or not.
    public var value: Bool

    /// Initializes a new instance of the `TableViewCellIsSelected` struct.
    /// - Parameter value: The value indicating whether the table view cell should be selected or not.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its selection state.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.isSelected = value
    }
}
/// A struct that represents an attribute for highlighting a table view cell.
public struct TableViewCellIsHighlighted: Attribute {
    /// The value indicating whether the table view cell should be highlighted.
    public var value: Bool

    /// Initializes a new instance of the `TableViewCellIsHighlighted` struct.
    /// - Parameter value: The value indicating whether the table view cell should be highlighted.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `isHighlighted` property of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.isHighlighted = value
    }
}
/// A struct representing an attribute that determines whether a table view cell shows the reorder control.
public struct TableViewCellShowsReorderControl: Attribute {
    /// The value indicating whether the table view cell shows the reorder control.
    public var value: Bool

    /// Initializes a new instance of the `TableViewCellShowsReorderControl` struct.
    /// - Parameter value: The value indicating whether the table view cell shows the reorder control.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `showsReorderControl` property to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.showsReorderControl = value
    }
}
/// A struct that represents an attribute for configuring the `shouldIndentWhileEditing` property of a `UITableViewCell`.
public struct TableViewCellShouldIndentWhileEditing: Attribute {
    public var value: Bool

    /// Initializes a new instance of `TableViewCellShouldIndentWhileEditing`.
    /// - Parameter value: A boolean value indicating whether the cell should indent while editing.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the provided view by setting the `shouldIndentWhileEditing` property of the `UITableViewCell`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.shouldIndentWhileEditing = value
    }
}
/// A struct that represents an attribute for configuring the accessory type of a table view cell.
public struct TableViewCellAccessoryType: Attribute {
    /// The value of the accessory type.
    public var value: UITableViewCell.AccessoryType

    /// Initializes a new instance of the `TableViewCellAccessoryType` struct.
    /// - Parameter value: The value of the accessory type.
    public init(value: UITableViewCell.AccessoryType) {
        self.value = value
    }

    /// Modifies the specified view by setting its accessory type to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.accessoryType = value
    }
}
/// A struct representing an attribute for configuring the accessory view of a table view cell.
public struct TableViewCellAccessoryView: Attribute {
    /// The value of the accessory view.
    public var value: UIView

    /// Initializes a new instance of the `TableViewCellAccessoryView` struct.
    /// - Parameter value: The value of the accessory view.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the specified view by setting the accessory view of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.accessoryView = value
    }
}
/// A struct that represents an attribute for configuring the editing accessory type of a table view cell.
public struct TableViewCellEditingAccessoryType: Attribute {
    /// The value of the editing accessory type.
    public var value: UITableViewCell.AccessoryType

    /// Initializes a new instance of the `TableViewCellEditingAccessoryType` struct.
    /// - Parameter value: The value of the editing accessory type.
    public init(value: UITableViewCell.AccessoryType) {
        self.value = value
    }

    /// Modifies the specified view by setting its editing accessory type to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.editingAccessoryType = value
    }
}
/// A struct that represents an attribute for configuring the editing accessory view of a table view cell.
public struct TableViewCellEditingAccessoryView: Attribute {
    /// The value of the editing accessory view.
    public var value: UIView

    /// Initializes a new instance of the TableViewCellEditingAccessoryView struct.
    /// - Parameter value: The value of the editing accessory view.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the provided view by setting the editing accessory view of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.editingAccessoryView = value
    }
}
/// A struct that represents the indentation level attribute for a table view cell.
public struct TableViewCellIndentationLevel: Attribute {
    /// The value of the indentation level.
    public var value: Int

    /// Initializes a new instance of the `TableViewCellIndentationLevel` struct.
    /// - Parameter value: The value of the indentation level.
    public init(value: Int) {
        self.value = value
    }

    /// Modifies the given view by setting the indentation level of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.indentationLevel = value
    }
}
/// A struct that represents the indentation width attribute for a table view cell.
public struct TableViewCellIndentationWidth: Attribute {
    /// The value of the indentation width.
    public var value: CGFloat

    /// Initializes a new instance of the `TableViewCellIndentationWidth` struct.
    /// - Parameter value: The value of the indentation width.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting the indentation width of the table view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.indentationWidth = value
    }
}
/// A struct that represents the separator inset attribute for a table view cell.
public struct TableViewCellSeparatorInset: Attribute {
    public var value: UIEdgeInsets

    /// Initializes a new instance of `TableViewCellSeparatorInset` with the specified value.
    /// - Parameter value: The separator inset value.
    public init(value: UIEdgeInsets) {
        self.value = value
    }

    /// Modifies the provided view by setting the separator inset to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.separatorInset = value
    }
}
/// A struct that represents an attribute for modifying the editing state of a table view cell.
public struct TableViewCellIsEditing: Attribute {
    public var value: Bool

    /// Initializes a new `TableViewCellIsEditing` instance with the specified value.
    /// - Parameter value: The editing state value.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its editing state to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.isEditing = value
    }
}
/// A struct that represents the focus style for a table view cell.
public struct TableViewCellFocusStyle: Attribute {
    /// The value of the focus style.
    public var value: UITableViewCell.FocusStyle

    /// Initializes a new instance of the TableViewCellFocusStyle struct.
    /// - Parameter value: The value of the focus style.
    public init(value: UITableViewCell.FocusStyle) {
        self.value = value
    }

    /// Modifies the given view with the focus style.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableViewCell = view as? UITableViewCell else { return }
        tableViewCell.focusStyle = value
    }
}
#endif
