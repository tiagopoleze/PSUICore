#if os(iOS)
import UIKit

/// Enum representing attributes for a collection view.
public enum CollectionViewAttribute: Attribute {
    /// The collection view layout for the collection view.
    case collectionViewLayout(UICollectionViewLayout)
    /// The delegate for the collection view.
    case delegate(UICollectionViewDelegate)
    /// The data source for the collection view.
    case dataSource(UICollectionViewDataSource)
    /// The prefetch data source for the collection view.
    case prefetchDataSource(UICollectionViewDataSourcePrefetching)
    /// The value indicating whether prefetching is enabled or disabled.
    case isPrefetchingEnabled(Bool)
    /// The drag delegate for the collection view.
    case dragDelegate(UICollectionViewDragDelegate)
    /// The drop delegate for the collection view.
    case dropDelegate(UICollectionViewDropDelegate)
    /// The value indicating whether drag interaction is enabled or disabled.
    case dragInteractionEnabled(Bool)
    /// The reordering cadence for the collection view.
    case reorderingCadence(UICollectionView.ReorderingCadence)
    /// The self-sizing invalidation value for the collection view.
    case selfSizingInvalidation(UICollectionView.SelfSizingInvalidation)
    /// The background view for the collection view.
    case backgroundView(UIView)
    /// The value indicating whether multiple selection is allowed.
    case allowsMultipleSelection(Bool)
    /// The value indicating whether the collection view should remember the last focused index path.
    case remembersLastFocusedIndexPath(Bool)
    /// The value indicating whether selection follows focus.
    case selectionFollowsFocus(Bool)
    /// The value indicating whether focus is allowed in the collection view.
    case allowsFocus(Bool)
    /// The value indicating whether focus is allowed during editing.
    case allowsFocusDuringEditing(Bool)
    /// The value indicating whether editing mode is enabled or disabled.
    case isEditing(Bool)
    /// The value indicating whether selection is allowed during editing.
    case allowsSelectionDuringEditing(Bool)
    /// The value indicating whether multiple selection during editing is allowed.
    case allowsMultipleSelectionDuringEditing(Bool)
    /// The value representing a registered cell class and its identifier for a collection view.
    case collectionViewRegisterNibKind(CollectionViewRegisterNibKindValue)
    // swiftlint:disable:next identifier_name
    // The value representing a registered view class for a specific element kind in a collection view.
    case collectionViewRegisterViewClassElementKind(CollectionViewRegisterViewClassElementKindValue)
    /// The value representing a registered nib and identifier for a collection view.
    case collectionViewRegisterNibIdentifier(CollectionViewRegisterNibIdentifierValue)
    // swiftlint:disable:next identifier_name
    /// The value representing a registered cell class and its identifier for a collection view.
    case collectionViewRegisterCellClassIdentifier(CollectionViewRegisterCellClassIdentifierValue)
    /// The view attribute.
    case view(ViewAttribute)
    
    /// The value of the attribute.
    public var value: any Attribute {
        switch self {
        case .collectionViewLayout(let uICollectionViewLayout):
            return CollectionViewCollectionViewLayout(value: uICollectionViewLayout)
        case .delegate(let uICollectionViewDelegate):
            return CollectionViewDelegate(value: uICollectionViewDelegate)
        case .dataSource(let uICollectionViewDataSource):
            return CollectionViewDataSource(value: uICollectionViewDataSource)
        case .prefetchDataSource(let uICollectionViewDataSourcePrefetching):
            return CollectionViewPrefetchDataSource(value: uICollectionViewDataSourcePrefetching)
        case .isPrefetchingEnabled(let bool):
            return CollectionViewIsPrefetchingEnabled(value: bool)
        case .dragDelegate(let uICollectionViewDragDelegate):
            return CollectionViewDragDelegate(value: uICollectionViewDragDelegate)
        case .dropDelegate(let uICollectionViewDropDelegate):
            return CollectionViewDropDelegate(value: uICollectionViewDropDelegate)
        case .dragInteractionEnabled(let bool):
            return CollectionViewDragInteractionEnabled(value: bool)
        case .reorderingCadence(let reorderingCadence):
            return CollectionViewReorderingCadence(value: reorderingCadence)
        case .selfSizingInvalidation(let selfSizingInvalidation):
            return CollectionViewSelfSizingInvalidation(value: selfSizingInvalidation)
        case .backgroundView(let uIView):
            return CollectionViewBackgroundView(value: uIView)
        case .allowsMultipleSelection(let bool):
            return CollectionViewAllowsMultipleSelection(value: bool)
        case .remembersLastFocusedIndexPath(let bool):
            return CollectionViewRemembersLastFocusedIndexPath(value: bool)
        case .selectionFollowsFocus(let bool):
            if #available(iOS 14.0, *) {
                return CollectionViewSelectionFollowsFocus(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .allowsFocus(let bool):
            if #available(iOS 15.0, *) {
                return CollectionViewAllowsFocus(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .allowsFocusDuringEditing(let bool):
            if #available(iOS 15.0, *) {
                return CollectionViewAllowsFocusDuringEditing(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .isEditing(let bool):
            if #available(iOS 14.0, *) {
                return CollectionViewIsEditing(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .allowsSelectionDuringEditing(let bool):
            if #available(iOS 14.0, *) {
                return CollectionViewAllowsSelectionDuringEditing(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .allowsMultipleSelectionDuringEditing(let bool):
            if #available(iOS 14.0, *) {
                return CollectionViewAllowsMultipleSelectionDuringEditing(value: bool)
            } else {
                return EmptyAttribute()
            }
        case let .collectionViewRegisterNibKind(value):
            return CollectionViewRegisterNibKind(value: value)
        case let .collectionViewRegisterViewClassElementKind(value):
            return CollectionViewRegisterViewClassElementKind(value: value)
        case let .collectionViewRegisterNibIdentifier(value):
            return CollectionViewRegisterNibIdentifier(value: value)
        case let .collectionViewRegisterCellClassIdentifier(value):
            return CollectionViewRegisterCellClassIdentifier(value: value)
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }
    
    /// Modifies the specified view by applying the attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct that represents an attribute for a collection view's collection view layout.
public struct CollectionViewCollectionViewLayout: Attribute {
    public let value: UICollectionViewLayout
    
    /// Initializes a new instance of `CollectionViewCollectionViewLayout`.
    /// - Parameter value: The collection view layout value.
    public init(value: UICollectionViewLayout) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its collection view layout to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.collectionViewLayout = value
    }
}
/// A struct that represents an attribute for a collection view delegate.
public struct CollectionViewDelegate: Attribute {
    public let value: UICollectionViewDelegate
    
    /// Initializes a new instance of `CollectionViewDelegate`.
    /// - Parameter value: The collection view delegate.
    public init(value: UICollectionViewDelegate) {
        self.value = value
    }
    
    /// Modifies the specified view by assigning the collection view delegate.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.delegate = value
    }
}
/// A struct that represents an attribute for a collection view's data source.
public struct CollectionViewDataSource: Attribute {
    /// The value of the data source.
    public let value: UICollectionViewDataSource
    
    /// Initializes a new instance of `CollectionViewDataSource`.
    /// - Parameter value: The value of the data source.
    public init(value: UICollectionViewDataSource) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its data source to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dataSource = value
    }
}
/// A struct that represents an attribute for configuring the prefetch data source of a collection view.
public struct CollectionViewPrefetchDataSource: Attribute {
    /// The data source object that provides the prefetching behavior for the collection view.
    public let value: UICollectionViewDataSourcePrefetching
    
    /// Initializes a new instance of `CollectionViewPrefetchDataSource`.
    /// - Parameter value: The data source object that provides the prefetching behavior for the collection view.
    public init(value: UICollectionViewDataSourcePrefetching) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its prefetch data source to the provided value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.prefetchDataSource = value
    }
}
/// A struct representing the attribute for enabling or disabling prefetching in a collection view.
public struct CollectionViewIsPrefetchingEnabled: Attribute {
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewIsPrefetchingEnabled`.
    /// - Parameter value: A boolean value indicating whether prefetching is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the given view by enabling or disabling prefetching in the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.isPrefetchingEnabled = value
    }
}
/// A struct that represents an attribute for a collection view's drag delegate.
public struct CollectionViewDragDelegate: Attribute {
    public let value: UICollectionViewDragDelegate
    
    /// Initializes a new instance of `CollectionViewDragDelegate`.
    /// - Parameter value: The drag delegate for the collection view.
    public init(value: UICollectionViewDragDelegate) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its drag delegate to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dragDelegate = value
    }
}
/// A struct that represents an attribute for a collection view's drop delegate.
public struct CollectionViewDropDelegate: Attribute {
    /// The value of the drop delegate.
    public let value: UICollectionViewDropDelegate
    
    /// Initializes a new instance of `CollectionViewDropDelegate`.
    /// - Parameter value: The value of the drop delegate.
    public init(value: UICollectionViewDropDelegate) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its drop delegate to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dropDelegate = value
    }
}
/// A struct that represents the attribute for enabling or disabling drag interaction in a collection view.
public struct CollectionViewDragInteractionEnabled: Attribute {
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewDragInteractionEnabled` with the specified value.
    /// - Parameter value: A boolean value indicating whether drag interaction should be enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by enabling or disabling drag interaction in the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dragInteractionEnabled = value
    }
}
/// A struct that represents an attribute for configuring the reordering cadence of a collection view.
public struct CollectionViewReorderingCadence: Attribute {
    /// The value of the reordering cadence.
    public let value: UICollectionView.ReorderingCadence
    
    /// Initializes a new instance of `CollectionViewReorderingCadence` with the specified value.
    /// - Parameter value: The value of the reordering cadence.
    public init(value: UICollectionView.ReorderingCadence) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its reordering cadence to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.reorderingCadence = value
    }
}

/// A struct that represents an attribute for self-sizing invalidation in a collection view.
@available(iOS 16.0, *)
public struct CollectionViewSelfSizingInvalidation: Attribute {
    public let value: UICollectionView.SelfSizingInvalidation
    
    /// Initializes a new instance of `CollectionViewSelfSizingInvalidation`.
    /// - Parameter value: The self-sizing invalidation value for the collection view.
    public init(value: UICollectionView.SelfSizingInvalidation) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the self-sizing invalidation value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.selfSizingInvalidation = value
    }
}

/// A struct that represents an attribute for setting the background view of a collection view.
public struct CollectionViewBackgroundView: Attribute {
    public let value: UIView
    
    /// Initializes a new instance of `CollectionViewBackgroundView`.
    /// - Parameter value: The background view to be set.
    public init(value: UIView) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its background view to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.backgroundView = value
    }
}

/// A struct that represents an attribute for enabling or disabling multiple selection in a collection view.
public struct CollectionViewAllowsMultipleSelection: Attribute {
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewAllowsMultipleSelection`.
    /// - Parameter value: A boolean value indicating whether multiple selection is allowed.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by enabling or disabling multiple selection in the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsMultipleSelection = value
    }
}

// swiftlint:disable:next type_name
/// A struct that represents an attribute for a collection view to remember the last focused index path.
public struct CollectionViewRemembersLastFocusedIndexPath: Attribute {
    /// The value indicating whether the collection view should remember the last focused index path.
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewRemembersLastFocusedIndexPath`.
    /// - Parameter value: The value indicating whether the collection view should remember the last focused index path.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the `remembersLastFocusedIndexPath` property of the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.remembersLastFocusedIndexPath = value
    }
}

/// A struct that represents an attribute for allowing selection to follow focus in a collection view.
@available(iOS 14.0, *)
public struct CollectionViewSelectionFollowsFocus: Attribute {
    /// The value indicating whether selection follows focus.
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewSelectionFollowsFocus`.
    /// - Parameter value: The value indicating whether selection follows focus.
    /// - Note: This attribute is only available in iOS 14.0 and later.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the `selectionFollowsFocus` property of the collection view.
    /// - Parameter view: The view to be modified.
    /// - Note: This method is only available in iOS 14.0 and later.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.selectionFollowsFocus = value
    }
}

/// A struct that represents an attribute for allowing focus in a collection view.
@available(iOS 15.0, *)
public struct CollectionViewAllowsFocus: Attribute {
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewAllowsFocus`.
    /// - Parameter value: A boolean value indicating whether focus is allowed in the collection view.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the `allowsFocus` property of the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsFocus = value
    }
}

/// A struct that represents an attribute for allowing focus during editing in a collection view.
@available(iOS 15.0, *)
public struct CollectionViewAllowsFocusDuringEditing: Attribute {
    /// The value indicating whether focus is allowed during editing.
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewAllowsFocusDuringEditing`.
    /// - Parameter value: The value indicating whether focus is allowed during editing.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the `allowsFocusDuringEditing` property of the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsFocusDuringEditing = value
    }
}

/// A struct that represents an attribute for enabling or disabling editing mode in a collection view.
@available(iOS 14.0, *)
public struct CollectionViewIsEditing: Attribute {
    /// The value indicating whether editing mode is enabled or disabled.
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewIsEditing` with the specified value.
    /// - Parameter value: The value indicating whether editing mode is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by enabling or disabling editing mode in the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.isEditing = value
    }
}

@available(iOS 14.0, *)
// swiftlint:disable:next type_name
/// A struct that represents an attribute for allowing selection during editing in a collection view.
public struct CollectionViewAllowsSelectionDuringEditing: Attribute {
    /// The value indicating whether selection is allowed during editing.
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewAllowsSelectionDuringEditing`.
    /// - Parameter value: The value indicating whether selection is allowed during editing.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the `allowsSelectionDuringEditing` property of the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsSelectionDuringEditing = value
    }
}

@available(iOS 14.0, *)
// swiftlint:disable:next type_name
/// A struct that represents an attribute for allowing multiple selection during editing in a collection view.
public struct CollectionViewAllowsMultipleSelectionDuringEditing: Attribute {
    public let value: Bool
    
    /// Initializes a new instance of `CollectionViewAllowsMultipleSelectionDuringEditing`.
    /// - Parameter value: A boolean value indicating whether multiple selection during editing is allowed.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the `allowsMultipleSelectionDuringEditing` property of the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsMultipleSelectionDuringEditing = value
    }
}

// swiftlint:disable:next type_name
/// A struct that represents an attribute for registering a cell class identifier in a collection view.
public struct CollectionViewRegisterCellClassIdentifier: Attribute {
    /// The value of the attribute.
    public var value: CollectionViewRegisterCellClassIdentifierValue
    
    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: CollectionViewRegisterCellClassIdentifierValue) {
        self.value = value
    }
    
    /// Modifies the given view by registering the cell class identifier in the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(value.cellClass, forCellWithReuseIdentifier: value.identifier)
    }
}

// swiftlint:disable:next type_name
/// A value that represents a registered cell class and its identifier for a collection view.
public struct CollectionViewRegisterCellClassIdentifierValue {
    /// The cell class to be registered.
    public let cellClass: AnyClass
    /// The identifier for the registered cell class.
    public let identifier: String
    
    /// Initializes a new instance of `CollectionViewRegisterCellClassIdentifierValue`.
    /// - Parameters:
    ///   - cellClass: The cell class to be registered.
    ///   - identifier: The identifier for the registered cell class.
    public init(cellClass: AnyClass, identifier: String) {
        self.cellClass = cellClass
        self.identifier = identifier
    }
}

/// A struct representing an attribute for registering a nib with a collection view.
public struct CollectionViewRegisterNibIdentifier: Attribute {
    /// The value of the attribute.
    public var value: CollectionViewRegisterNibIdentifierValue
    
    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: CollectionViewRegisterNibIdentifierValue) {
        self.value = value
    }
    
    /// Modifies the given view by registering the nib with the collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(value.nib, forCellWithReuseIdentifier: value.identifier)
    }
}

/// A value representing a registered nib and identifier for a collection view.
public struct CollectionViewRegisterNibIdentifierValue {
    /// The nib used to register the collection view cell.
    public let nib: UINib
    /// The identifier used to register the collection view cell.
    public let identifier: String
    
    /// Initializes a new instance of `CollectionViewRegisterNibIdentifierValue`.
    /// - Parameters:
    ///   - nib: The nib used to register the collection view cell.
    ///   - identifier: The identifier used to register the collection view cell.
    public init(nib: UINib, identifier: String) {
        self.nib = nib
        self.identifier = identifier
    }
}

// swiftlint:disable:next type_name
/// A struct that represents an attribute for registering a view class in a collection view.
public struct CollectionViewRegisterViewClassElementKind: Attribute {
    /// The value of the attribute.
    public var value: CollectionViewRegisterViewClassElementKindValue
    
    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value of the attribute.
    public init(value: CollectionViewRegisterViewClassElementKindValue) {
        self.value = value
    }
    
    /// Modifies the specified view by registering the view class for a supplementary view of a specific kind.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(
            value.viewClass,
            forSupplementaryViewOfKind: value.elementKind,
            withReuseIdentifier: value.identifier
        )
    }
}

// swiftlint:disable:next type_name
/// A value representing a registered view class for a specific element kind in a collection view.
public struct CollectionViewRegisterViewClassElementKindValue {
    /// The view class to be registered.
    public let viewClass: AnyClass
    /// The element kind for which the view class is registered.
    public let elementKind: String
    /// The identifier for the registered view class.
    public let identifier: String
    
    /// Initializes a new instance of `CollectionViewRegisterViewClassElementKindValue`.
    /// - Parameters:
    ///   - viewClass: The view class to be registered.
    ///   - elementKind: The element kind for which the view class is registered.
    ///   - identifier: The identifier for the registered view class.
    public init(viewClass: AnyClass, elementKind: String, identifier: String) {
        self.viewClass = viewClass
        self.elementKind = elementKind
        self.identifier = identifier
    }
}

/// A struct that represents an attribute for registering a nib for a supplementary view in a collection view.
public struct CollectionViewRegisterNibKind: Attribute {
    /// The value of the attribute.
    public var value: CollectionViewRegisterNibKindValue
    
    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value of the attribute.
    public init(value: CollectionViewRegisterNibKindValue) {
        self.value = value
    }
    
    /// Modifies the specified view by registering a nib for a supplementary view in a collection view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(
            value.nib,
            forSupplementaryViewOfKind: value.elementKind,
            withReuseIdentifier: value.identifier
        )
    }
}

/// A value that represents a nib, element kind, and identifier for a `UICollectionView`.
public struct CollectionViewRegisterNibKindValue {
    /// The nib to register.
    public let nib: UINib
    /// The element kind to register.
    public let elementKind: String
    /// The identifier to register.
    public let identifier: String
    
    /// Creates a new value that represents a nib, element kind, and identifier for a `UICollectionView`.
    /// - Parameters:
    /// - nib: The nib to register.
    /// - elementKind: The element kind to register.
    /// - identifier: The identifier to register.
    public init(nib: UINib, elementKind: String, identifier: String) {
        self.nib = nib
        self.elementKind = elementKind
        self.identifier = identifier
    }
}
#endif
