// swiftlint:disable file_length
#if os(iOS)
import UIKit

public enum TableViewAttribute: Attribute {
    case isPrefetchingEnabled(Bool)
    case rowHeight(CGFloat)
    case sectionHeaderHeight(CGFloat)
    case sectionFooterHeight(CGFloat)
    case estimatedRowHeight(CGFloat)
    case estimatedSectionHeaderHeight(CGFloat)
    case estimatedSectionFooterHeight(CGFloat)
    case fillerRowHeight(CGFloat)
    case sectionHeaderTopPadding(CGFloat)
    case separatorInset(UIEdgeInsets)
    case separatorInsetReference(UITableView.SeparatorInsetReference)
    case backgroundView(UIView)
    case allowsSelection(Bool)
    case allowsSelectionDuringEditing(Bool)
    case allowsMultipleSelection(Bool)
    case allowsMultipleSelectionDuringEditing(Bool)
    case sectionIndexMinimumDisplayRowCount(Int)
    case sectionIndexColor(UIColor)
    case sectionIndexBackgroundColor(UIColor)
    case sectionIndexTrackingBackgroundColor(UIColor)
    case separatorStyle(UITableViewCell.SeparatorStyle)
    case separatorColor(UIColor)
    case separatorEffect(UIVisualEffect)
    case cellLayoutMarginsFollowReadableWidth(Bool)
    case insetsContentViewsToSafeArea(Bool)
    case tableHeaderView(UIView)
    case tableFooterView(UIView)
    case registerNIBForCellReuseIdentifier(TableViewRegisterNIBForCellReuseIdentifierValue)
    // swiftlint:disable:next identifier_name
    case registerNibForHeaderFooterViewReuseIdentifierValue(TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue)
    // swiftlint:disable:next identifier_name
    case registerAnyClassForCellReuseIdentifierValue(TableViewRegisterAnyClassForCellReuseIdentifierValue)
    // swiftlint:disable:next identifier_name
    case registerAnyClassForHeaderFooterViewReuseIdentifierValue(
        TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue
    )
    case remembersLastFocusedIndexPath(Bool)
    case selectionFollowsFocus(Bool)
    case allowsFocus(Bool)
    case allowsFocusDuringEditing(Bool)
    case dragInteractionEnabled(Bool)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

@available(iOS 15.0, *)
public struct TableViewIsPrefetchingEnabled: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.isPrefetchingEnabled = value
    }
}

public struct TableViewRowHeight: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.rowHeight = value
    }
}

public struct TableViewSectionHeaderHeight: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionHeaderHeight = value
    }
}

public struct TableViewSectionFooterHeight: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionFooterHeight = value
    }
}

public struct TableViewEstimatedRowHeight: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.estimatedRowHeight = value
    }
}

public struct TableViewEstimatedSectionHeaderHeight: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.estimatedSectionHeaderHeight = value
    }
}

public struct TableViewEstimatedSectionFooterHeight: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.estimatedSectionFooterHeight = value
    }
}

@available(iOS 15.0, *)
public struct TableViewFillerRowHeight: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.fillerRowHeight = value
    }
}

@available(iOS 15.0, *)
public struct TableViewSectionHeaderTopPadding: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionHeaderTopPadding = value
    }
}

public struct TableViewSeparatorInset: Attribute {
    public var value: UIEdgeInsets

    public init(value: UIEdgeInsets) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorInset = value
    }
}

public struct TableViewSeparatorInsetReference: Attribute {
    public var value: UITableView.SeparatorInsetReference

    public init(value: UITableView.SeparatorInsetReference) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorInsetReference = value
    }
}

@available(iOS 16.0, *)
public struct TableViewSelfSizingInvalidation: Attribute {
    public var value: UITableView.SelfSizingInvalidation

    public init(value: UITableView.SelfSizingInvalidation) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.selfSizingInvalidation = value
    }
}

public struct TableViewBackgroundView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.backgroundView = value
    }
}

public struct TableViewAllowsSelection: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsSelection = value
    }
}

public struct TableViewAllowsSelectionDuringEditing: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsSelectionDuringEditing = value
    }
}

public struct TableViewAllowsMultipleSelection: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsMultipleSelection = value
    }
}

// swiftlint:disable:next type_name
public struct TableViewAllowsMultipleSelectionDuringEditing: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsMultipleSelectionDuringEditing = value
    }
}

// swiftlint:disable:next type_name
public struct TableViewSectionIndexMinimumDisplayRowCount: Attribute {
    public var value: Int

    public init(value: Int) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexMinimumDisplayRowCount = value
    }
}

public struct TableViewSectionIndexColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexColor = value
    }
}

public struct TableViewSectionIndexBackgroundColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexBackgroundColor = value
    }
}

// swiftlint:disable:next type_name
public struct TableViewSectionIndexTrackingBackgroundColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.sectionIndexTrackingBackgroundColor = value
    }
}

public struct TableViewSeparatorStyle: Attribute {
    public var value: UITableViewCell.SeparatorStyle

    public init(value: UITableViewCell.SeparatorStyle) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorStyle = value
    }
}

public struct TableViewSeparatorColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorColor = value
    }
}

public struct TableViewSeparatorEffect: Attribute {
    public var value: UIVisualEffect

    public init(value: UIVisualEffect) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.separatorEffect = value
    }
}

// swiftlint:disable:next type_name
public struct TableViewCellLayoutMarginsFollowReadableWidth: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.cellLayoutMarginsFollowReadableWidth = value
    }
}

public struct TableViewInsetsContentViewsToSafeArea: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.insetsContentViewsToSafeArea = value
    }
}

public struct TableViewTableHeaderView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.tableHeaderView = value
    }
}

public struct TableViewTableFooterView: Attribute {
    public var value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.tableFooterView = value
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue {
    public let anyClass: AnyClass
    public let forHeaderFooterViewReuseIdentifier: String

    public init(anyClass: AnyClass, forHeaderFooterViewReuseIdentifier: String) {
        self.anyClass = anyClass
        self.forHeaderFooterViewReuseIdentifier = forHeaderFooterViewReuseIdentifier
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifier: Attribute {
    public var value: TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue

    public init(value: TableViewRegisterAnyClassForHeaderFooterViewReuseIdentifierValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.register(value.anyClass, forHeaderFooterViewReuseIdentifier: value.forHeaderFooterViewReuseIdentifier)
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue {
    public let nib: UINib
    public let forHeaderFooterViewReuseIdentifier: String

    public init(nib: UINib, forHeaderFooterViewReuseIdentifier: String) {
        self.nib = nib
        self.forHeaderFooterViewReuseIdentifier = forHeaderFooterViewReuseIdentifier
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterNibForHeaderFooterViewReuseIdentifier: Attribute {
    public var value: TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue

    public init(value: TableViewRegisterNibForHeaderFooterViewReuseIdentifierValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.register(value.nib, forHeaderFooterViewReuseIdentifier: value.forHeaderFooterViewReuseIdentifier)
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterAnyClassForCellReuseIdentifierValue {
    public let cellClass: AnyClass
    public let forCellReuseIdentifier: String

    public init(cellClass: AnyClass, forCellReuseIdentifier: String) {
        self.cellClass = cellClass
        self.forCellReuseIdentifier = forCellReuseIdentifier
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterAnyClassForCellReuseIdentifier: Attribute {
    public var value: TableViewRegisterAnyClassForCellReuseIdentifierValue

    public init(value: TableViewRegisterAnyClassForCellReuseIdentifierValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {

        guard let tableView = view as? UITableView else { return }
        tableView.register(value.cellClass, forCellReuseIdentifier: value.forCellReuseIdentifier)
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterNIBForCellReuseIdentifierValue {
    public let nib: UINib
    public let forCellReuseIdentifier: String

    public init(nib: UINib, forCellReuseIdentifier: String) {
        self.nib = nib
        self.forCellReuseIdentifier = forCellReuseIdentifier
    }
}

// swiftlint:disable:next type_name
public struct TableViewRegisterNIBForCellReuseIdentifier: Attribute {

    public let value: TableViewRegisterNIBForCellReuseIdentifierValue

    public init(value: TableViewRegisterNIBForCellReuseIdentifierValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.register(value.nib, forCellReuseIdentifier: value.forCellReuseIdentifier)
    }
}
public struct TableViewRemembersLastFocusedIndexPath: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.remembersLastFocusedIndexPath = value
    }
}
@available(iOS 14.0, *)
public struct TableViewSelectionFollowsFocus: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.selectionFollowsFocus = value
    }
}

@available(iOS 15.0, *)
public struct TableViewAllowsFocus: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsFocus = value
    }
}

@available(iOS 15.0, *)
public struct TableViewAllowsFocusDuringEditing: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.allowsFocusDuringEditing = value
    }
}

public struct TableViewdragInteractionEnabled: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let tableView = view as? UITableView else { return }
        tableView.dragInteractionEnabled = value
    }
}
#endif
