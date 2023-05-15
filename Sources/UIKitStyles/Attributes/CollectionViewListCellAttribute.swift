#if os(iOS)
import UIKit

public enum CollectionViewListCellAttribute: Attribute {
    case indentationLevel(Int)
    case indentationWidth(CGFloat)
    case indentsAccessories(Bool)
    case cell(CollectionViewCellAttribute)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

@available(iOS 14.0, *)
public struct CollectionViewListIndentationLevel: Attribute {
    public var value: Int

    public init(value: Int) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let cell = view as? UICollectionViewListCell else { return }
        cell.indentationLevel = value
    }
}

@available(iOS 14.0, *)
public struct CollectionViewListIndentationWidth: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let cell = view as? UICollectionViewListCell else { return }
        cell.indentationWidth = value
    }
}

@available(iOS 14.0, *)
public struct CollectionViewListIndentsAccessories: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let cell = view as? UICollectionViewListCell else { return }
        cell.indentsAccessories = value
    }
}
#endif
