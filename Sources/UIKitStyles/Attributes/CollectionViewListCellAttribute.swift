//
//  CollectionViewListCellAttribute.swift
//  
//
//  Created by Tiago Ferreira on 11/05/2023.
//

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
            return CollectionViewListIndentationLevel(value: int)
        case .indentationWidth(let cGFloat):
            return CollectionViewListIndentationWidth(value: cGFloat)
        case .indentsAccessories(let bool):
            return CollectionViewListIndentsAccessories(value: bool)
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
