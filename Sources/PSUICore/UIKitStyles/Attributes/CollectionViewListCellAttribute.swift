#if os(iOS)
import UIKit

/// A collection view list cell attribute.
public enum CollectionViewListCellAttribute: Attribute {
    /// The indentation level attribute.
    case indentationLevel(Int)
    /// The indentation width attribute.
    case indentationWidth(CGFloat)
    /// The indents accessories attribute.
    case indentsAccessories(Bool)
    /// The cell attribute.
    case cell(CollectionViewCellAttribute)
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute value.
    public var value: any Attribute {
        switch self {
        case .indentationLevel(let int):
            if #available(iOS 14.0, *) {
                return CollectionViewListIndentationLevel(value: int)
            } else {
                return EmptyAttribute()
            }
        case .indentationWidth(let cGFloat):
            if #available(iOS 14.0, *) {
                return CollectionViewListIndentationWidth(value: cGFloat)
            } else {
                return EmptyAttribute()
            }
        case .indentsAccessories(let bool):
            if #available(iOS 14.0, *) {
                return CollectionViewListIndentsAccessories(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .cell(let collectionViewCellAttribute):
            return collectionViewCellAttribute.value
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
/// A struct representing the indentation level attribute for a collection view list cell.
public struct CollectionViewListIndentationLevel: Attribute {
    /// The value of the indentation level.
    public var value: Int

    /// Initializes a new instance of the `CollectionViewListIndentationLevel` struct.
    /// - Parameter value: The value of the indentation level.
    public init(value: Int) {
        self.value = value
    }

    /// Modifies the specified view by setting the indentation level of the collection view list cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let cell = view as? UICollectionViewListCell else { return }
        cell.indentationLevel = value
    }
}

@available(iOS 14.0, *)
/// A struct representing the indentation width attribute for a collection view list cell.
public struct CollectionViewListIndentationWidth: Attribute {
    /// The value of the indentation width.
    public var value: CGFloat

    /// Initializes a new instance of the `CollectionViewListIndentationWidth` struct.
    /// - Parameter value: The value of the indentation width.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting the indentation width of the collection view list cell.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let cell = view as? UICollectionViewListCell else { return }
        cell.indentationWidth = value
    }
}

@available(iOS 14.0, *)
/// A struct representing an attribute for modifying the `indentsAccessories` property of a `UICollectionViewListCell`.
public struct CollectionViewListIndentsAccessories: Attribute {
    /// The value to set for the `indentsAccessories` property.
    public var value: Bool

    /// Initializes a new instance of `CollectionViewListIndentsAccessories`.
    /// - Parameter value: The value to set for the `indentsAccessories` property.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the `indentsAccessories` property of a given view.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let cell = view as? UICollectionViewListCell else { return }
        cell.indentsAccessories = value
    }
}
#endif
