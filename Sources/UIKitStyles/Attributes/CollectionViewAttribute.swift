#if os(iOS)
import UIKit

public enum CollectionViewAttribute: Attribute {
    case collectionViewLayout(UICollectionViewLayout)
    case delegate(UICollectionViewDelegate)
    case dataSource(UICollectionViewDataSource)
    case prefetchDataSource(UICollectionViewDataSourcePrefetching)
    case isPrefetchingEnabled(Bool)
    case dragDelegate(UICollectionViewDragDelegate)
    case dropDelegate(UICollectionViewDropDelegate)
    case dragInteractionEnabled(Bool)
    case reorderingCadence(UICollectionView.ReorderingCadence)
//    case selfSizingInvalidation(UICollectionView.SelfSizingInvalidation)
    case backgroundView(UIView)
    case allowsMultipleSelection(Bool)
    case remembersLastFocusedIndexPath(Bool)
    case selectionFollowsFocus(Bool)
    case allowsFocus(Bool)
    case allowsFocusDuringEditing(Bool)
    case isEditing(Bool)
    case allowsSelectionDuringEditing(Bool)
    case allowsMultipleSelectionDuringEditing(Bool)
    case collectionViewRegisterNibKind(CollectionViewRegisterNibKindValue)
    // swiftlint:disable:next identifier_name
    case collectionViewRegisterViewClassElementKind(CollectionViewRegisterViewClassElementKindValue)
    case collectionViewRegisterNibIdentifier(CollectionViewRegisterNibIdentifierValue)
    // swiftlint:disable:next identifier_name
    case collectionViewRegisterCellClassIdentifier(CollectionViewRegisterCellClassIdentifierValue)
    case view(ViewAttribute)

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
//        case .selfSizingInvalidation(let selfSizingInvalidation):
//            return CollectionViewSelfSizingInvalidation(value: selfSizingInvalidation)
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

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

public struct CollectionViewCollectionViewLayout: Attribute {
    public let value: UICollectionViewLayout

    public init(value: UICollectionViewLayout) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.collectionViewLayout = value
    }
}
public struct CollectionViewDelegate: Attribute {
    public let value: UICollectionViewDelegate

    public init(value: UICollectionViewDelegate) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.delegate = value
    }
}
public struct CollectionViewDataSource: Attribute {
    public let value: UICollectionViewDataSource

    public init(value: UICollectionViewDataSource) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dataSource = value
    }
}
public struct CollectionViewPrefetchDataSource: Attribute {
    public let value: UICollectionViewDataSourcePrefetching

    public init(value: UICollectionViewDataSourcePrefetching) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.prefetchDataSource = value
    }
}
public struct CollectionViewIsPrefetchingEnabled: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.isPrefetchingEnabled = value
    }
}
public struct CollectionViewDragDelegate: Attribute {
    public let value: UICollectionViewDragDelegate

    public init(value: UICollectionViewDragDelegate) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dragDelegate = value
    }
}
public struct CollectionViewDropDelegate: Attribute {
    public let value: UICollectionViewDropDelegate

    public init(value: UICollectionViewDropDelegate) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dropDelegate = value
    }
}
public struct CollectionViewDragInteractionEnabled: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.dragInteractionEnabled = value
    }
}
public struct CollectionViewReorderingCadence: Attribute {
    public let value: UICollectionView.ReorderingCadence

    public init(value: UICollectionView.ReorderingCadence) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.reorderingCadence = value
    }
}
@available(iOS 16.0, *)
public struct CollectionViewSelfSizingInvalidation: Attribute {
    public let value: UICollectionView.SelfSizingInvalidation

    public init(value: UICollectionView.SelfSizingInvalidation) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.selfSizingInvalidation = value
    }
}
public struct CollectionViewBackgroundView: Attribute {
    public let value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.backgroundView = value
    }
}
public struct CollectionViewAllowsMultipleSelection: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsMultipleSelection = value
    }
}

// swiftlint:disable:next type_name
public struct CollectionViewRemembersLastFocusedIndexPath: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.remembersLastFocusedIndexPath = value
    }
}
@available(iOS 14.0, *)
public struct CollectionViewSelectionFollowsFocus: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.selectionFollowsFocus = value
    }
}
@available(iOS 15.0, *)
public struct CollectionViewAllowsFocus: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsFocus = value
    }
}
@available(iOS 15.0, *)
public struct CollectionViewAllowsFocusDuringEditing: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsFocusDuringEditing = value
    }
}
@available(iOS 14.0, *)
public struct CollectionViewIsEditing: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.isEditing = value
    }
}

@available(iOS 14.0, *)
// swiftlint:disable:next type_name
public struct CollectionViewAllowsSelectionDuringEditing: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsSelectionDuringEditing = value
    }
}

@available(iOS 14.0, *)
// swiftlint:disable:next type_name
public struct CollectionViewAllowsMultipleSelectionDuringEditing: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.allowsMultipleSelectionDuringEditing = value
    }
}

// swiftlint:disable:next type_name
public struct CollectionViewRegisterCellClassIdentifier: Attribute {
    public var value: CollectionViewRegisterCellClassIdentifierValue

    public init(value: CollectionViewRegisterCellClassIdentifierValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(value.cellClass, forCellWithReuseIdentifier: value.identifier)
    }
}

// swiftlint:disable:next type_name
public struct CollectionViewRegisterCellClassIdentifierValue {
    public let cellClass: AnyClass
    public let identifier: String

    public init(cellClass: AnyClass, identifier: String) {
        self.cellClass = cellClass
        self.identifier = identifier
    }
}

public struct CollectionViewRegisterNibIdentifier: Attribute {
    public var value: CollectionViewRegisterNibIdentifierValue

    public init(value: CollectionViewRegisterNibIdentifierValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(value.nib, forCellWithReuseIdentifier: value.identifier)
    }
}

public struct CollectionViewRegisterNibIdentifierValue {
    public let nib: UINib
    public let identifier: String

    public init(nib: UINib, identifier: String) {
        self.nib = nib
        self.identifier = identifier
    }
}

// swiftlint:disable:next type_name
public struct CollectionViewRegisterViewClassElementKind: Attribute {
    public var value: CollectionViewRegisterViewClassElementKindValue

    public init(value: CollectionViewRegisterViewClassElementKindValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(
            value.viewClass,
            forSupplementaryViewOfKind: value.elementKind,
            withReuseIdentifier: value.identifier
        )
    }
}

// swiftlint:disable:next type_name
public struct CollectionViewRegisterViewClassElementKindValue {
    public let viewClass: AnyClass
    public let elementKind: String
    public let identifier: String

    public init(viewClass: AnyClass, elementKind: String, identifier: String) {
        self.viewClass = viewClass
        self.elementKind = elementKind
        self.identifier = identifier
    }
}

public struct CollectionViewRegisterNibKind: Attribute {
    public var value: CollectionViewRegisterNibKindValue

    public init(value: CollectionViewRegisterNibKindValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionView = view as? UICollectionView else { return }
        collectionView.register(
            value.nib,
            forSupplementaryViewOfKind: value.elementKind,
            withReuseIdentifier: value.identifier
        )
    }
}

public struct CollectionViewRegisterNibKindValue {
    public let nib: UINib
    public let elementKind: String
    public let identifier: String

    public init(nib: UINib, elementKind: String, identifier: String) {
        self.nib = nib
        self.elementKind = elementKind
        self.identifier = identifier
    }
}
#endif
