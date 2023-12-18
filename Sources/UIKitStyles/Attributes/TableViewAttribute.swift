// swiftlint:disable file_length
#if os(iOS)
import UIKit

/// Enum that represents attributes for a UITableView.
public enum TableViewAttribute: Attribute {
    /// The value for the `isPrefetchingEnabled` property.
    case isPrefetchingEnabled(Bool)
    /// The value for the `rowHeight` property.
    case rowHeight(CGFloat)
    /// The value for the `sectionHeaderHeight` property.
    case sectionHeaderHeight(CGFloat)
    /// The value for the `sectionFooterHeight` property.
    case sectionFooterHeight(CGFloat)
    /// The value for the `estimatedRowHeight` property.
    case estimatedRowHeight(CGFloat)
    /// The value for the `estimatedSectionHeaderHeight` property.
    case estimatedSectionHeaderHeight(CGFloat)
    /// The value for the `estimatedSectionFooterHeight` property.
    case estimatedSectionFooterHeight(CGFloat)
    /// The value for the `fillerRowHeight` property.
    case fillerRowHeight(CGFloat)
    /// The value for the `sectionHeaderTopPadding` property.
    case sectionHeaderTopPadding(CGFloat)
    /// The value for the `separatorInset` property.
    case separatorInset(UIEdgeInsets)
    /// The value for the `separatorInsetReference` property.
    case separatorInsetReference(UITableView.SeparatorInsetReference)
    /// The value for the `backgroundView` property.
    case backgroundView(UIView)
    /// The value for the `allowsSelection` property.
    case allowsSelection(Bool)
    /// The value for the `allowsSelectionDuringEditing` property.
    case allowsSelectionDuringEditing(Bool)
    /// The value for the `allowsMultipleSelection` property.
    case allowsMultipleSelection(Bool)
    /// The value for the `allowsMultipleSelectionDuringEditing` property.
    case allowsMultipleSelectionDuringEditing(Bool)
    /// The value for the `sectionIndexMinimumDisplayRowCount` property.
    case sectionIndexMinimumDisplayRowCount(Int)
    /// The value for the `sectionIndexColor` property.
    case sectionIndexColor(UIColor)
    /// The value for the `sectionIndexBackgroundColor` property.
    case sectionIndexBackgroundColor(UIColor)
    /// The value for the `sectionIndexTrackingBackgroundColor` property.
    case sectionIndexTrackingBackgroundColor(UIColor)
    /// The value for the `separatorStyle` property.
    case separatorStyle(UITableViewCell.SeparatorStyle)
    /// The value for the `separatorColor` property.
    case separatorColor(UIColor)
    /// The value for the `separatorEffect` property.
    case separatorEffect(UIVisualEffect)
    /// The value for the `cellLayoutMarginsFollowReadableWidth` property.
    case cellLayoutMarginsFollowReadableWidth(Bool)
    /// The value for the `insetsContentViewsToSafeArea` property.
    case insetsContentViewsToSafeArea(Bool)
    /// The value for the `tableHeaderView` property.
    case tableHeaderView(UIView)
    /// The value for the `tableFooterView` property.
    case tableFooterView(UIView)
    /// The value for the `remembersLastFocusedIndexPath` property.
    case registerNIBForCellReuseIdentifier(TableViewRegisterNIBForCellReuseIdentifierValue)
    /// The value for the `registerNibForHeaderFooterViewReuseIdentifier` property.
    case registerNibForHeaderFooterViewReuseIdentifierValue(TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue)
    /// The value for the `registerAnyClassForCellReuseIdentifier` property.
    case registerAnyClassForCellReuseIdentifierValue(TableViewRegisterAnyClassForCellReuseIdentifierValue)
    /// The value for the `registerAnyClassForHeaderFooterViewReuseIdentifier` property.
    case registerAnyClassForHeaderFooterViewReuseIdentifierValue(
        TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue
    )
    /// The value for the `remembersLastFocusedIndexPath` property.
    case remembersLastFocusedIndexPath(Bool)
    /// The value for the `selectionFollowsFocus` property.
    case selectionFollowsFocus(Bool)
    /// The value for the `allowsFocus` property.
    case allowsFocus(Bool)
    /// The value for the `allowsFocusDuringEditing` property.
    case allowsFocusDuringEditing(Bool)
    /// The value for the `dragInteractionEnabled` property.
    case dragInteractionEnabled(Bool)
    /// The value view attribute.
    case view(ViewAttribute)

    /// The value associated with the attribute.
    public var value: any Attribute {
        switch self {
        case let .view(value):
            return value.value
        case let .isPrefetchingEnabled(value):
            if #available(iOS 15.0, *) {
                return TableViewIsPrefetchingEnabled(value: value)
            } else {
                return EmptyAttribute()
            }
        case let .rowHeight(value):
            return TableViewRowHeight(value: value)
        case let .sectionHeaderHeight(value):
            return TableViewSectionHeaderHeight(value: value)
        case let .sectionFooterHeight(value):
            return TableViewSectionFooterHeight(value: value)
        case let .estimatedRowHeight(value):
            return TableViewEstimatedRowHeight(value: value)
        case let .estimatedSectionHeaderHeight(value):
            return TableViewEstimatedSectionHeaderHeight(value: value)
        case let .estimatedSectionFooterHeight(value):
            return TableViewEstimatedSectionFooterHeight(value: value)
        case let .fillerRowHeight(value):
            if #available(iOS 15.0, *) {
                return TableViewFillerRowHeight(value: value)
            } else {
                return EmptyAttribute()
            }
        case let .sectionHeaderTopPadding(value):
            if #available(iOS 15.0, *) {
                return TableViewSectionHeaderTopPadding(value: value)
            } else {
                return EmptyAttribute()
            }
        case let .separatorInset(value):
            return TableViewSeparatorInset(value: value)
        case let .separatorInsetReference(value):
            return TableViewSeparatorInsetReference(value: value)
        case let .backgroundView(value):
            return TableViewBackgroundView(value: value)
        case let .allowsSelection(value):
            return TableViewAllowsSelection(value: value)
        case let .allowsSelectionDuringEditing(value):
            return TableViewAllowsSelectionDuringEditing(value: value)
        case let .allowsMultipleSelection(value):
            return TableViewAllowsMultipleSelection(value: value)
        case let .allowsMultipleSelectionDuringEditing(value):
            return TableViewAllowsMultipleSelectionDuringEditing(value: value)
        case let .sectionIndexMinimumDisplayRowCount(value):
            return TableViewSectionIndexMinimumDisplayRowCount(value: value)
        case let .sectionIndexColor(value):
            return TableViewSectionIndexColor(value: value)
        case let .sectionIndexBackgroundColor(value):
            return TableViewSectionIndexBackgroundColor(value: value)
        case let .sectionIndexTrackingBackgroundColor(value):
            return TableViewSectionIndexTrackingBackgroundColor(value: value)
        case let .separatorStyle(value):
            return TableViewSeparatorStyle(value: value)
        case let .separatorColor(value):
            return TableViewSeparatorColor(value: value)
        case let .separatorEffect(value):
            return TableViewSeparatorEffect(value: value)
        case let .cellLayoutMarginsFollowReadableWidth(value):
            return TableViewCellLayoutMarginsFollowReadableWidth(value: value)
        case let .insetsContentViewsToSafeArea(value):
            return TableViewInsetsContentViewsToSafeArea(value: value)
        case let .tableHeaderView(value):
            return TableViewTableHeaderView(value: value)
        case let .tableFooterView(value):
            return TableViewTableFooterView(value: value)
        case let .registerNIBForCellReuseIdentifier(value):
            return TableViewRegisterNIBForCellReuseIdentifier(value: value)
        case let .registerNibForHeaderFooterViewReuseIdentifierValue(value):
            return TableViewRegisterNibForHeaderFooterViewReuseIdentifier(value: value)
        case let .registerAnyClassForCellReuseIdentifierValue(value):
            return TableViewRegisterAnyClassForCellReuseIdentifier(value: value)
        case let .registerAnyClassForHeaderFooterViewReuseIdentifierValue(value):
            return TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifier(value: value)
        case let .remembersLastFocusedIndexPath(value):
            return TableViewRemembersLastFocusedIndexPath(value: value)
        case let .selectionFollowsFocus(value):
            if #available(iOS 14.0, *) {
                return TableViewSelectionFollowsFocus(value: value)
            } else {
                return EmptyAttribute()
            }
        case let .allowsFocus(value):
            if #available(iOS 15.0, *) {
                return TableViewAllowsFocus(value: value)
            } else {
                return EmptyAttribute()
            }
        case let .allowsFocusDuringEditing(value):
            if #available(iOS 15.0, *) {
                return TableViewAllowsFocusDuringEditing(value: value)
            } else {
                return EmptyAttribute()
            }
        case let .dragInteractionEnabled(value):
            return TableViewdragInteractionEnabled(value: value)
        }
    }

    /// Modifies the specified view using the stored value.     
    /// - Parameters:
    ///    - view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

@available(iOS 15.0, *)
/// A struct representing an attribute for enabling or disabling table view prefetching.
public struct TableViewIsPrefetchingEnabled: Attribute {
    /// The value indicating whether table view prefetching is enabled or disabled.
    public var value: Bool

    /// Initializes a new instance of the `TableViewIsPrefetchingEnabled` struct.
    /// - Parameter value: The value indicating whether table view prefetching is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling table view prefetching.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.isPrefetchingEnabled = value
    }
}

/// A struct that represents the attribute for setting the row height of a table view.
public struct TableViewRowHeight: Attribute {
    /// The value of the row height.
    public var value: CGFloat

    /// Initializes a new instance of `TableViewRowHeight` with the specified value.
    /// - Parameter value: The value of the row height.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting the row height of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.rowHeight = value
    }
}

/// A struct representing the attribute for setting the height of the section header in a table view.
public struct TableViewSectionHeaderHeight: Attribute {
    public var value: CGFloat

    /// Initializes a new instance of `TableViewSectionHeaderHeight` with the specified value.
    /// - Parameter value: The height value for the section header.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting the section header height of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionHeaderHeight = value
    }
}

/// A struct that represents the attribute for setting the section footer height of a table view.
public struct TableViewSectionFooterHeight: Attribute {
    public var value: CGFloat

    /// Initializes a new instance of `TableViewSectionFooterHeight` with the specified value.
    /// - Parameter value: The section footer height value.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting the section footer height of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionFooterHeight = value
    }
}

/// A struct that represents an attribute for setting the estimated row height of a table view.
public struct TableViewEstimatedRowHeight: Attribute {
    /// The value of the estimated row height.
    public var value: CGFloat

    /// Initializes a new instance of the `TableViewEstimatedRowHeight` struct.
    /// - Parameter value: The value of the estimated row height.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting the estimated row height of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.estimatedRowHeight = value
    }
}

/// A struct that represents an attribute for setting the estimated section header height of a table view.
public struct TableViewEstimatedSectionHeaderHeight: Attribute {
    /// The value of the estimated section header height.
    public var value: CGFloat

    /// Initializes a new instance of the `TableViewEstimatedSectionHeaderHeight` struct.
    /// - Parameter value: The value of the estimated section header height.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting the estimated section header height of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.estimatedSectionHeaderHeight = value
    }
}

/// A struct that represents an attribute for setting the estimated section footer height of a table view.
public struct TableViewEstimatedSectionFooterHeight: Attribute {
    /// The value of the estimated section footer height.
    public var value: CGFloat

    /// Initializes a new instance of the `TableViewEstimatedSectionFooterHeight` struct.
    /// - Parameter value: The value of the estimated section footer height.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting the estimated section footer height of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.estimatedSectionFooterHeight = value
    }
}

@available(iOS 15.0, *)
/// A struct representing the attribute for setting the height of filler rows in a table view.
public struct TableViewFillerRowHeight: Attribute {
    public var value: CGFloat

    /// Initializes a `TableViewFillerRowHeight` instance with the specified value.
    /// - Parameter value: The height value for the filler rows.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting the filler row height of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.fillerRowHeight = value
    }
}

@available(iOS 15.0, *)
/// A struct representing the attribute for the top padding of a table view section header.
public struct TableViewSectionHeaderTopPadding: Attribute {
    /// The value of the top padding.
    public var value: CGFloat

    /// Initializes a new instance of `TableViewSectionHeaderTopPadding`.
    /// - Parameter value: The value of the top padding.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting the section header top padding of a table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionHeaderTopPadding = value
    }
}

/// A struct representing the separator inset attribute for a table view.
public struct TableViewSeparatorInset: Attribute {
    public var value: UIEdgeInsets

    /// Initializes a new instance of `TableViewSeparatorInset` with the specified value.
    /// - Parameter value: The separator inset value.
    public init(value: UIEdgeInsets) {
        self.value = value
    }

    /// Modifies the specified view by setting the separator inset to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorInset = value
    }
}

/// A struct that represents an attribute for the separator inset reference of a table view.
public struct TableViewSeparatorInsetReference: Attribute {
    /// The value of the separator inset reference.
    public var value: UITableView.SeparatorInsetReference

    /// Initializes a new instance of `TableViewSeparatorInsetReference` with the specified value.
    /// - Parameter value: The value of the separator inset reference.
    public init(value: UITableView.SeparatorInsetReference) {
        self.value = value
    }

    /// Modifies the specified view by setting its separator inset reference to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorInsetReference = value
    }
}

@available(iOS 16.0, *)
/// A struct that represents an attribute for self-sizing invalidation of a table view.
public struct TableViewSelfSizingInvalidation: Attribute {
    /// The value of self-sizing invalidation for the table view.
    public var value: UITableView.SelfSizingInvalidation

    /// Initializes a new instance of `TableViewSelfSizingInvalidation` with the specified value.
    /// - Parameter value: The value of self-sizing invalidation for the table view.
    public init(value: UITableView.SelfSizingInvalidation) {
        self.value = value
    }

    /// Modifies the specified view by setting the self-sizing invalidation value of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.selfSizingInvalidation = value
    }
}

/// A struct that represents an attribute for setting the background view of a table view.
public struct TableViewBackgroundView: Attribute {
    public var value: UIView

    /// Initializes a `TableViewBackgroundView` with the specified background view.
    /// - Parameter value: The background view to be set.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the specified view by setting its background view to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.backgroundView = value
    }
}

/// A struct that represents an attribute for allowing selection in a table view.
public struct TableViewAllowsSelection: Attribute {
    public var value: Bool

    /// Initializes a new instance of `TableViewAllowsSelection`.
    /// - Parameter value: A boolean value indicating whether selection is allowed.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `allowsSelection` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsSelection = value
    }
}

/// A struct that represents an attribute for allowing selection during editing in a table view.
public struct TableViewAllowsSelectionDuringEditing: Attribute {
    public var value: Bool

    /// Initializes a new instance of `TableViewAllowsSelectionDuringEditing`.
    /// - Parameter value: A boolean value indicating whether selection is allowed during editing.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `allowsSelectionDuringEditing` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsSelectionDuringEditing = value
    }
}

/// A struct representing an attribute that allows multiple selection in a table view.
public struct TableViewAllowsMultipleSelection: Attribute {
    /// The value indicating whether multiple selection is allowed.
    public var value: Bool

    /// Initializes a new instance of `TableViewAllowsMultipleSelection`.
    /// - Parameter value: The value indicating whether multiple selection is allowed.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the given view by setting the `allowsMultipleSelection` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsMultipleSelection = value
    }
}

/// A struct that represents an attribute for allowing multiple selection during editing in a table view.
public struct TableViewAllowsMultipleSelectionDuringEditing: Attribute {
    public var value: Bool

    /// Initializes a new instance of `TableViewAllowsMultipleSelectionDuringEditing`.
    /// - Parameter value: A boolean value indicating whether multiple selection during editing is allowed.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `allowsMultipleSelectionDuringEditing` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsMultipleSelectionDuringEditing = value
    }
}

/// A struct that represents an attribute for modifying the minimum number of rows to display in the section index of a table view.
public struct TableViewSectionIndexMinimumDisplayRowCount: Attribute {
    /// The value representing the minimum number of rows to display in the section index.
    public var value: Int

    /// Initializes a new instance of `TableViewSectionIndexMinimumDisplayRowCount` with the specified value.
    /// - Parameter value: The minimum number of rows to display in the section index.
    public init(value: Int) {
        self.value = value
    }

    /// Modifies the specified view by setting the `sectionIndexMinimumDisplayRowCount` property of the table view to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexMinimumDisplayRowCount = value
    }
}

/// A struct that represents the color of the section index in a table view.
public struct TableViewSectionIndexColor: Attribute {
    public var value: UIColor

    /// Initializes a `TableViewSectionIndexColor` with the specified color.
    /// - Parameter value: The color of the section index.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the section index color of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexColor = value
    }
}

/// A struct representing the background color of the section index in a table view.
public struct TableViewSectionIndexBackgroundColor: Attribute {
    /// The color value for the background color attribute.
    public var value: UIColor

    /// Initializes a new instance of the `TableViewSectionIndexBackgroundColor` struct.
    /// - Parameter value: The color value for the background color attribute.
    /// - Returns: A new instance of the `TableViewSectionIndexBackgroundColor` struct.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the section index background color to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexBackgroundColor = value
    }
}

/// A struct representing the background color attribute for the section index tracking of a table view.
public struct TableViewSectionIndexTrackingBackgroundColor: Attribute {
    public var value: UIColor

    /// Initializes a `TableViewSectionIndexTrackingBackgroundColor` with the specified color value.
    /// - Parameter value: The color value for the background color attribute.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the section index tracking background color to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexTrackingBackgroundColor = value
    }
}

/// A struct that represents the separator style for a table view.
public struct TableViewSeparatorStyle: Attribute {
    /// The value of the separator style.
    public var value: UITableViewCell.SeparatorStyle

    /// Initializes a new instance of the `TableViewSeparatorStyle` struct.
    /// - Parameter value: The value of the separator style.
    public init(value: UITableViewCell.SeparatorStyle) {
        self.value = value
    }

    /// Modifies the provided view by setting the separator style of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorStyle = value
    }
}

/// A struct that represents the attribute for setting the separator color of a table view.
public struct TableViewSeparatorColor: Attribute {
    /// The color value for the separator.
    public var value: UIColor

    /// Initializes a new instance of `TableViewSeparatorColor` with the specified color value.
    /// - Parameter value: The color value for the separator.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the separator color of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorColor = value
    }
}

/// A struct that represents an attribute for customizing the separator effect of a table view.
public struct TableViewSeparatorEffect: Attribute {
    /// The visual effect to be applied as the separator effect.
    public var value: UIVisualEffect

    /// Initializes a new instance of `TableViewSeparatorEffect`.
    /// - Parameter value: The visual effect to be applied as the separator effect.
    public init(value: UIVisualEffect) {
        self.value = value
    }

    /// Modifies the specified view by setting the separator effect of a table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorEffect = value
    }
}

/// A struct that represents an attribute for a table view cell layout margins follow readable width.
public struct TableViewCellLayoutMarginsFollowReadableWidth: Attribute {
    /// The value indicating whether the table view cell layout margins should follow the readable width.
    public var value: Bool

    /// Initializes a new instance of the `TableViewCellLayoutMarginsFollowReadableWidth` struct.
    /// - Parameter value: The value indicating whether the table view cell layout margins should follow the readable width.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the given view by setting the `cellLayoutMarginsFollowReadableWidth` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.cellLayoutMarginsFollowReadableWidth = value
    }
}

/// A struct that represents an attribute for modifying the `insetsContentViewsToSafeArea` property of a `UITableView`.
public struct TableViewInsetsContentViewsToSafeArea: Attribute {
    public var value: Bool

    /// Initializes a new instance of `TableViewInsetsContentViewsToSafeArea` with the specified value.
    /// - Parameter value: The value to set for the `insetsContentViewsToSafeArea` property.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the `insetsContentViewsToSafeArea` property of the specified view.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.insetsContentViewsToSafeArea = value
    }
}

/// A struct that represents an attribute for setting the table header view of a UITableView.
public struct TableViewTableHeaderView: Attribute {
    public var value: UIView

    /// Initializes a new instance of the TableViewTableHeaderView struct.
    /// - Parameter value: The UIView to be set as the table header view.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the specified view by setting the table header view of a UITableView.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.tableHeaderView = value
    }
}

/// A struct that represents an attribute for setting the table footer view of a UITableView.
public struct TableViewTableFooterView: Attribute {
    /// The value of the table footer view.
    public var value: UIView

    /// Initializes a new instance of TableViewTableFooterView.
    /// - Parameter value: The value of the table footer view.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the given view by setting the table footer view of a UITableView.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.tableFooterView = value
    }
}

/// A value used to register a class for a header or footer view reuse identifier in a table view.
public struct TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue {
    /// The class to be registered.
    public let anyClass: AnyClass
    /// The reuse identifier for the header or footer view.
    public let forHeaderFooterViewReuseIdentifier: String

    /// Initializes a new instance of `TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue`.
    /// - Parameters:
    ///   - anyClass: The class to be registered.
    ///   - forHeaderFooterViewReuseIdentifier: The reuse identifier for the header or footer view.
    public init(anyClass: AnyClass, forHeaderFooterViewReuseIdentifier: String) {
        self.anyClass = anyClass
        self.forHeaderFooterViewReuseIdentifier = forHeaderFooterViewReuseIdentifier
    }
}

/// A struct that represents an attribute for registering any class for header/footer view reuse identifier in a table view.
public struct TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifier: Attribute {
    /// The value of the attribute.
    public var value: TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue

    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue) {
        self.value = value
    }

    /// Modifies the given view by registering the specified class for the header/footer view reuse identifier in a table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.register(value.anyClass, forHeaderFooterViewReuseIdentifier: value.forHeaderFooterViewReuseIdentifier)
    }
}

/// A value type that represents the registration of a nib for a header or footer view reuse identifier in a table view.
public struct TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue {
    /// The nib object containing the header or footer view.
    public let nib: UINib
    /// The reuse identifier for the header or footer view.
    public let forHeaderFooterViewReuseIdentifier: String

    /// Initializes a new instance of `TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue`.
    /// - Parameters:
    ///   - nib: The nib object containing the header or footer view.
    ///   - forHeaderFooterViewReuseIdentifier: The reuse identifier for the header or footer view.
    public init(nib: UINib, forHeaderFooterViewReuseIdentifier: String) {
        self.nib = nib
        self.forHeaderFooterViewReuseIdentifier = forHeaderFooterViewReuseIdentifier
    }
}

/// A struct representing an attribute for registering a nib for a header or footer view reuse identifier in a table view.
public struct TableViewRegisterNibForHeaderFooterViewReuseIdentifier: Attribute {
    /// The value of the attribute.
    public var value: TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue

    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue) {
        self.value = value
    }

    /// Modifies the given view by registering the nib for the header or footer view reuse identifier in a table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.register(value.nib, forHeaderFooterViewReuseIdentifier: value.forHeaderFooterViewReuseIdentifier)
    }
}

/// A value type that represents the registration of a cell class for a specific reuse identifier in a table view.
public struct TableViewRegisterAnyClassForCellReuseIdentifierValue {
    /// The cell class to be registered.
    public let cellClass: AnyClass
    /// The reuse identifier to be associated with the cell class.
    public let forCellReuseIdentifier: String

    /// Initializes a new instance of `TableViewRegisterAnyClassForCellReuseIdentifierValue`.
    /// - Parameters:
    ///   - cellClass: The cell class to be registered.
    ///   - forCellReuseIdentifier: The reuse identifier to be associated with the cell class.
    public init(cellClass: AnyClass, forCellReuseIdentifier: String) {
        self.cellClass = cellClass
        self.forCellReuseIdentifier = forCellReuseIdentifier
    }
}

/// A struct that represents an attribute for registering a class for a cell reuse identifier in a table view.
public struct TableViewRegisterAnyClassForCellReuseIdentifier: Attribute {
    /// The value of the attribute.
    public var value: TableViewRegisterAnyClassForCellReuseIdentifierValue

    /// Initializes a new instance of the struct.
    /// - Parameter value: The value of the attribute.
    public init(value: TableViewRegisterAnyClassForCellReuseIdentifierValue) {
        self.value = value
    }

    /// Modifies the provided view by registering the specified cell class for the reuse identifier in a table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.register(value.cellClass, forCellReuseIdentifier: value.forCellReuseIdentifier)
    }
}

/// A value type that represents the registration of a NIB for a table view cell reuse identifier.
public struct TableViewRegisterNIBForCellReuseIdentifierValue {
    /// The NIB to be registered.
    public let nib: UINib
    /// The reuse identifier for the table view cell.
    public let forCellReuseIdentifier: String

    /// Initializes a new instance of `TableViewRegisterNIBForCellReuseIdentifierValue`.
    /// - Parameters:
    ///   - nib: The NIB to be registered.
    ///   - forCellReuseIdentifier: The reuse identifier for the table view cell.
    public init(nib: UINib, forCellReuseIdentifier: String) {
        self.nib = nib
        self.forCellReuseIdentifier = forCellReuseIdentifier
    }
}

/// A struct that represents an attribute for registering a NIB for a cell reuse identifier in a table view.
public struct TableViewRegisterNIBForCellReuseIdentifier: Attribute {

    /// The value of the attribute.
    public let value: TableViewRegisterNIBForCellReuseIdentifierValue

    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: TableViewRegisterNIBForCellReuseIdentifierValue) {
        self.value = value
    }

    /// Modifies the given view by registering the NIB for the cell reuse identifier in a table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.register(value.nib, forCellReuseIdentifier: value.forCellReuseIdentifier)
    }
}
/// A struct that represents an attribute for a table view to remember the last focused index path.
public struct TableViewRemembersLastFocusedIndexPath: Attribute {
    /// The value indicating whether the table view should remember the last focused index path.
    public let value: Bool

    /// Initializes a new instance of the `TableViewRemembersLastFocusedIndexPath` struct.
    /// - Parameter value: The value indicating whether the table view should remember the last focused index path.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `remembersLastFocusedIndexPath` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.remembersLastFocusedIndexPath = value
    }
}
@available(iOS 14.0, *)
/// A struct that represents an attribute for a table view to enable or disable selection follows focus behavior.
public struct TableViewSelectionFollowsFocus: Attribute {
    /// The value indicating whether the selection follows focus behavior is enabled or disabled.
    public let value: Bool

    /// Initializes a new instance of `TableViewSelectionFollowsFocus` with the specified value.
    /// - Parameter value: The value indicating whether the selection follows focus behavior is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view to enable or disable the selection follows focus behavior.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.selectionFollowsFocus = value
    }
}

@available(iOS 15.0, *)
/// A struct representing an attribute that allows or disallows focus on a table view.
public struct TableViewAllowsFocus: Attribute {
    /// The value indicating whether focus is allowed or not.
    public let value: Bool

    /// Initializes a new instance of `TableViewAllowsFocus`.
    /// - Parameter value: The value indicating whether focus is allowed or not.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the given view by setting the `allowsFocus` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsFocus = value
    }
}

@available(iOS 15.0, *)
/// A struct representing an attribute that allows focus during editing for a table view.
public struct TableViewAllowsFocusDuringEditing: Attribute {
    /// The value indicating whether focus is allowed during editing.
    public let value: Bool

    /// Initializes a new instance of `TableViewAllowsFocusDuringEditing`.
    /// - Parameter value: The value indicating whether focus is allowed during editing.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `allowsFocusDuringEditing` property of the table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsFocusDuringEditing = value
    }
}

/// A struct representing the attribute for enabling or disabling drag interaction in a table view.
public struct TableViewdragInteractionEnabled: Attribute {
    public let value: Bool

    /// Initializes a new instance of `TableViewdragInteractionEnabled`.
    /// - Parameter value: A boolean value indicating whether drag interaction should be enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling drag interaction in a table view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.dragInteractionEnabled = value
    }
}
#endif
