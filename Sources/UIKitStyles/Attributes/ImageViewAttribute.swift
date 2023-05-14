//
//  ImageViewAttribute.swift
//  
//
//  Created by Tiago Ferreira on 21/04/2023.
//

#if os(iOS)
import UIKit

public enum ImageViewAttribute: Attribute {
    case image(UIImage)
    case highlightedImage(UIImage)
    case preferredSymbolConfiguration(UIImage.SymbolConfiguration)
    case isUserInteractionEnabled(Bool)
    case isHighlighted(Bool)
    case animationImages([UIImage])
    case highlightedAnimationImages([UIImage])
    case animationDuration(TimeInterval)
    case animationRepeatCount(Int)
    case tintColor(UIColor)
    case accessibility(String)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case .image(let value):
            return ImageViewImage(value: value)
        case .highlightedImage(let value):
            return ImageViewHighlightedImage(value: value)
        case .preferredSymbolConfiguration(let value):
            return ImageViewPreferredSymbolConfiguration(value: value)
        case .isUserInteractionEnabled(let value):
            return ImageViewIsUserInteractionEnabled(value: value)
        case .isHighlighted(let value):
            return ImageViewIsHighlighted(value: value)
        case .animationImages(let value):
            return ImageViewAnimationImages(value: value)
        case .highlightedAnimationImages(let value):
            return ImageViewHighlightedAnimationImages(value: value)
        case .animationDuration(let value):
            return ImageViewAnimationDuration(value: value)
        case .animationRepeatCount(let value):
            return ImageViewAnimationRepeatCount(value: value)
        case .tintColor(let value):
            return ImageViewTintColor(value: value)
        case let .accessibility(value):
            return ImageViewAccessibility(value: value)
        case let .view(value):
            return value.value
        }
    }

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct ImageViewAccessibility: Attribute {
    public var value: String

    public init(value: String) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.accessibilityIdentifier = value
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
}

public struct ImageViewTintColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.tintColor = value
    }
}

public struct ImageViewPreferredSymbolConfiguration: Attribute {
    public var value: UIImage.SymbolConfiguration

    public init(value: UIImage.SymbolConfiguration) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.preferredSymbolConfiguration = value
    }
}

public struct ImageViewIsUserInteractionEnabled: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.isUserInteractionEnabled = value
    }
}

public struct ImageViewIsHighlighted: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.isHighlighted = value
    }
}

public struct ImageViewImage: Attribute {
    public var value: UIImage

    public init(value: UIImage) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.image = value
    }
}

public struct ImageViewHighlightedImage: Attribute {
    public var value: UIImage

    public init(value: UIImage) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.highlightedImage = value
    }
}

public struct ImageViewHighlightedAnimationImages: Attribute {
    public var value: [UIImage]

    public init(value: [UIImage]) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.highlightedAnimationImages = value
    }
}

public struct ImageViewAnimationRepeatCount: Attribute {
    public var value: Int

    public init(value: Int) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.animationRepeatCount = value
    }
}

public struct ImageViewAnimationImages: Attribute {
    public var value: [UIImage]

    public init(value: [UIImage]) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.animationImages = value
    }
}

public struct ImageViewAnimationDuration: Attribute {
    public var value: TimeInterval

    public init(value: TimeInterval) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.animationDuration = value
    }
}
#endif
