#if os(iOS)
import UIKit

/// An image view attribute.
public enum ImageViewAttribute: Attribute {
    /// The image attribute.
    case image(UIImage)
    /// The highlighted image attribute.
    case highlightedImage(UIImage)
    /// The preferred symbol configuration attribute.
    case preferredSymbolConfiguration(UIImage.SymbolConfiguration)
    /// The isUserInteractionEnabled attribute.
    case isUserInteractionEnabled(Bool)
    /// The isHighlighted attribute.
    case isHighlighted(Bool)
    /// The animationImages attribute.
    case animationImages([UIImage])
    /// The highlightedAnimationImages attribute.
    case highlightedAnimationImages([UIImage])
    /// The animationDuration attribute.
    case animationDuration(TimeInterval)
    /// The animationRepeatCount attribute.
    case animationRepeatCount(Int)
    /// The tint color attribute.
    case tintColor(UIColor)
    /// The accessibility attribute.
    case accessibility(String)
    /// The view attribute.
    case view(ViewAttribute)
    
    /// The attribute value.
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
    
    /// Modifies the view with the attribute.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct representing an accessibility attribute for an image view.
public struct ImageViewAccessibility: Attribute {
    /// The value of the accessibility attribute.
    public var value: String
    
    /// Initializes a new instance of `ImageViewAccessibility` with the specified value.
    /// - Parameter value: The value of the accessibility attribute.
    public init(value: String) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the accessibility identifier and adjusting the image size for accessibility content size category.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.accessibilityIdentifier = value
        imageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
}

/// A struct representing an attribute for modifying the tint color of an image view.
public struct ImageViewTintColor: Attribute {
    /// The value of the tint color.
    public var value: UIColor
    
    /// Initializes a new instance of `ImageViewTintColor` with the specified tint color value.
    /// - Parameter value: The tint color value.
    public init(value: UIColor) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its tint color to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.tintColor = value
    }
}

@available(iOS 13.0, *)
/// A struct representing an attribute for configuring the preferred symbol configuration of an image view.
public struct ImageViewPreferredSymbolConfiguration: Attribute {
    /// The value of the preferred symbol configuration.
    public var value: UIImage.SymbolConfiguration
    
    /// Initializes a new instance of `ImageViewPreferredSymbolConfiguration` with the specified value.
    /// - Parameter value: The value of the preferred symbol configuration.
    public init(value: UIImage.SymbolConfiguration) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its preferred symbol configuration to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.preferredSymbolConfiguration = value
    }
}

/// A struct representing the attribute for enabling or disabling user interaction on an image view.
public struct ImageViewIsUserInteractionEnabled: Attribute {
    /// The value indicating whether user interaction is enabled or disabled.
    public var value: Bool
    
    /// Initializes a new instance of the `ImageViewIsUserInteractionEnabled` struct.
    /// - Parameter value: The value indicating whether user interaction is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by enabling or disabling user interaction on the image view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.isUserInteractionEnabled = value
    }
}

/// A struct representing an attribute for modifying the `isHighlighted` property of a `UIImageView`.
public struct ImageViewIsHighlighted: Attribute {
    public var value: Bool
    
    /// Initializes a new instance of `ImageViewIsHighlighted`.
    /// - Parameter value: The value to set for the `isHighlighted` property.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the `isHighlighted` property of a `UIView` instance, if it is a `UIImageView`.
    /// - Parameter view: The `UIView` instance to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.isHighlighted = value
    }
}

/// A struct that represents an attribute for setting the image of a UIImageView.
public struct ImageViewImage: Attribute {
    public var value: UIImage
    
    /// Initializes an ImageViewImage with the specified image.
    /// - Parameter value: The image to be set.
    public init(value: UIImage) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its image to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.image = value
    }
}

/// A struct representing an attribute for setting the highlighted image of a UIImageView.
public struct ImageViewHighlightedImage: Attribute {
    /// The value of the highlighted image.
    public var value: UIImage
    
    /// Initializes a new instance of ImageViewHighlightedImage.
    /// - Parameter value: The highlighted image to be set.
    public init(value: UIImage) {
        self.value = value
    }
    
    /// Modifies the provided view by setting its highlighted image to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.highlightedImage = value
    }
}

/// A struct that represents the attribute for setting the highlighted animation images of a UIImageView.
public struct ImageViewHighlightedAnimationImages: Attribute {
    public var value: [UIImage]
    
    /// Initializes the ImageViewHighlightedAnimationImages attribute with the specified array of images.
    /// - Parameter value: An array of UIImage objects representing the animation images.
    public init(value: [UIImage]) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its highlighted animation images to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.highlightedAnimationImages = value
    }
}

/// A struct that represents the attribute for setting the repeat count of an image view animation.
public struct ImageViewAnimationRepeatCount: Attribute {
    /// The value of the repeat count.
    public var value: Int
    
    /// Initializes the ImageViewAnimationRepeatCount with the specified value.
    /// - Parameter value: The repeat count value.
    public init(value: Int) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the animation repeat count.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.animationRepeatCount = value
    }
}

/// A struct that represents an attribute for setting animation images to a UIImageView.
public struct ImageViewAnimationImages: Attribute {
    /// The array of UIImage objects representing the animation images.
    public var value: [UIImage]
    
    /// Initializes the ImageViewAnimationImages attribute with the given animation images.
    /// - Parameter value: The array of UIImage objects representing the animation images.
    public init(value: [UIImage]) {
        self.value = value
    }
    
    /// Modifies the given view by setting the animation images to the UIImageView.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.animationImages = value
    }
}

/// A struct representing the animation duration attribute for UIImageView.
public struct ImageViewAnimationDuration: Attribute {
    /// The value of the animation duration.
    public var value: TimeInterval
    
    /// Initializes a new instance of ImageViewAnimationDuration.
    /// - Parameter value: The value of the animation duration.
    public init(value: TimeInterval) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the animation duration.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let imageView = view as? UIImageView else { return }
        imageView.animationDuration = value
    }
}
#endif
