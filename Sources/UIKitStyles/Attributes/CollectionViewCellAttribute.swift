#if os(iOS)
import UIKit

/// A collection view cell attribute.
public enum CollectionViewCellAttribute: Attribute {
    /// The automatically updates content configuration attribute.
    case automaticallyUpdatesContentConfiguration(Bool)
    /// The is selected attribute.
    case isSelected(Bool)
    /// The is highlighted attribute.
    case isHighlighted(Bool)
    /// The automatically updates background configuration attribute.
    case automaticallyUpdatesBackgroundConfiguration(Bool)
    /// The background view attribute.
    case backgroundView(UIView)
    /// The selected background view attribute.
    case selectedBackgroundView(UIView)
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute value.
    public var value: any Attribute {
        switch self {
        case .automaticallyUpdatesContentConfiguration(let bool):
            if #available(iOS 14.0, *) {
                return CollectionViewCellAutomaticallyUpdatesContentConfiguration(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .isSelected(let bool):
            return CollectionViewCellIsSelected(value: bool)
        case .isHighlighted(let bool):
            return CollectionViewCellIsHighlighted(value: bool)
        case .automaticallyUpdatesBackgroundConfiguration(let bool):
            if #available(iOS 14.0, *) {
                return CollectionViewCellAutomaticallyUpdatesBackgroundConfiguration(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .backgroundView(let uIView):
            return CollectionViewCellBackgroundView(value: uIView)
        case .selectedBackgroundView(let uIView):
            return CollectionViewCellSelectedBackgroundView(value: uIView)
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    /// Modifies the view with the attribute.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for automatically updating the content configuration of a collection view cell.
public struct CollectionViewCellAutomaticallyUpdatesContentConfiguration: Attribute {
    /// The value indicating whether the content configuration of the collection view cell should be automatically updated.
    public let value: Bool

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value indicating whether the content configuration of the collection view cell should be automatically updated.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `automaticallyUpdatesContentConfiguration` property of the collection view cell to the attribute's value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.automaticallyUpdatesContentConfiguration = value
    }
}
/// A struct that represents an attribute for selecting a collection view cell.
public struct CollectionViewCellIsSelected: Attribute {
    /// The value indicating whether the collection view cell is selected.
    public let value: Bool

    /// Initializes a new instance of `CollectionViewCellIsSelected`.
    /// - Parameter value: The value indicating whether the collection view cell is selected.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `isSelected` property of the collection view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.isSelected = value
    }
}
/// A struct that represents an attribute for modifying the `isHighlighted` property of a `UICollectionViewCell`.
public struct CollectionViewCellIsHighlighted: Attribute {
    public let value: Bool

    /// Initializes a new instance of `CollectionViewCellIsHighlighted`.
    /// - Parameter value: The value to set for the `isHighlighted` property.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the `isHighlighted` property of a given view.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.isHighlighted = value
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for automatically updating the background configuration of a collection view cell.
public struct CollectionViewCellAutomaticallyUpdatesBackgroundConfiguration: Attribute {
    /// The value indicating whether the background configuration of the collection view cell should be automatically updated.
    public let value: Bool

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value indicating whether the background configuration of the collection view cell should be automatically updated.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `automaticallyUpdatesBackgroundConfiguration` property of the collection view cell to the attribute's value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.automaticallyUpdatesBackgroundConfiguration = value
    }
}
/// A struct that represents an attribute for the background view of a collection view cell.
public struct CollectionViewCellBackgroundView: Attribute {
    /// The value of the background view.
    public let value: UIView?

    /// Initializes a new instance of `CollectionViewCellBackgroundView`.
    /// - Parameter value: The value of the background view.
    public init(value: UIView?) {
        self.value = value
    }

    /// Modifies the provided view by setting the background view of the collection view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.backgroundView = value
    }
}
/// A struct that represents an attribute for the selected background view of a collection view cell.
public struct CollectionViewCellSelectedBackgroundView: Attribute {
    public let value: UIView?

    /// Initializes a new instance of `CollectionViewCellSelectedBackgroundView`.
    /// - Parameter value: The selected background view to be set for the collection view cell.
    public init(value: UIView?) {
        self.value = value
    }

    /// Modifies the provided view by setting the selected background view for the collection view cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.selectedBackgroundView = value
    }
}
#endif
