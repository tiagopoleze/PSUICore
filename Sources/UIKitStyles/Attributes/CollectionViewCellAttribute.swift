//
//  CollectionViewCellAttribute.swift
//  
//
//  Created by Tiago Ferreira on 11/05/2023.
//

#if os(iOS)
import UIKit

public enum CollectionViewCellAttribute: Attribute {
    case automaticallyUpdatesContentConfiguration(Bool)
    case isSelected(Bool)
    case isHighlighted(Bool)
    // swiftlint:disable:next identifier_name
    case automaticallyUpdatesBackgroundConfiguration(Bool)
    case backgroundView(UIView)
    case selectedBackgroundView(UIView)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case .automaticallyUpdatesContentConfiguration(let bool):
            return CollectionViewCellAutomaticallyUpdatesContentConfiguration(value: bool)
        case .isSelected(let bool):
            return CollectionViewCellIsSelected(value: bool)
        case .isHighlighted(let bool):
            return CollectionViewCellIsHighlighted(value: bool)
        case .automaticallyUpdatesBackgroundConfiguration(let bool):
            return CollectionViewCellAutomaticallyUpdatesBackgroundConfiguration(value: bool)
        case .backgroundView(let uIView):
            return CollectionViewCellBackgroundView(value: uIView)
        case .selectedBackgroundView(let uIView):
            return CollectionViewCellSelectedBackgroundView(value: uIView)
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

// swiftlint:disable:next type_name
public struct CollectionViewCellAutomaticallyUpdatesContentConfiguration: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.automaticallyUpdatesContentConfiguration = value
    }
}
public struct CollectionViewCellIsSelected: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.isSelected = value
    }
}
public struct CollectionViewCellIsHighlighted: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.isHighlighted = value
    }
}

// swiftlint:disable:next type_name
public struct CollectionViewCellAutomaticallyUpdatesBackgroundConfiguration: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.automaticallyUpdatesBackgroundConfiguration = value
    }
}
public struct CollectionViewCellBackgroundView: Attribute {
    public let value: UIView?

    public init(value: UIView?) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.backgroundView = value
    }
}
public struct CollectionViewCellSelectedBackgroundView: Attribute {
    public let value: UIView?

    public init(value: UIView?) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let collectionViewCell = view as? UICollectionViewCell else { return }
        collectionViewCell.selectedBackgroundView = value
    }
}
#endif
