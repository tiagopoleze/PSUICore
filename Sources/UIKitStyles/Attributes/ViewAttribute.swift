#if os(iOS)
import UIKit

/// A enu, that represents the attributes for a UIView.
public enum ViewAttribute: Attribute {
    /// A boolean value indicating whether the view should use autoresizing masks for layout.
    case translatesAutoresizingMaskIntoConstraints(Bool)
    /// The alpha value of the view.
    case alpha(CGFloat)
    /// The background color of the view.
    case backgroundColor(UIColor)
    /// A boolean value indicating whether the view's bounds should be clipped.
    case clipsToBounds(Bool)
    /// The content mode of the view.
    case contentMode(UIView.ContentMode)
    /// A boolean value indicating whether the view should be hidden or not.
    case isHidden(Bool)
    /// A boolean value indicating whether user interaction is enabled or disabled.
    case isUserInteractionEnabled(Bool)
    /// The layout margins for the view.
    case layoutMargins(UIEdgeInsets)
    /// The tag value for the view.
    case tag(Int)
    /// The tint color for the view.
    case tintColor(UIColor)
    /// The border color for the view's layer.
    case borderColor(UIColor)
    /// The border width for the view's layer.
    case borderWidth(CGFloat)
    /// The corner radius for the view's layer.
    case cornerRadius(CGFloat)
    /// The layer mask for the view.
    case mask(CALayer)
    /// The masked corners for the view's layer.
    case maskedCorners(CACornerMask)
    /// A boolean value indicating whether the view's layer is masked to bounds.
    case masksToBounds(Bool)
    /// The rasterization scale for the view's layer.
    case rasterizationScale(CGFloat)
    /// The shadow color for the view's layer.
    case shadowColor(UIColor)
    /// The shadow offset for the view's layer.
    case shadowOffset(CGSize)
    /// The shadow opacity for the view's layer.
    case shadowOpacity(Float)
    /// The shadow radius for the view's layer.
    case shadowRadius(CGFloat)
    /// A boolean value indicating whether the view's layer should be rasterized.
    case shouldRasterize(Bool)
    /// The accessibility identifier for the view.
    case accessibilityIdentifier(String)
    /// The border attributes for the view's layer.
    case tintAdjustmentMode(UIView.TintAdjustmentMode)
    /// The border attributes for the view's layer.
    case border(ViewLayerBorderValue)
    /// The shadow attributes for the view's layer.
    case shadow(ViewLayerShadowValue)

    /// The value of the attribute.
    public var value: any Attribute {
        switch self {
        case let .translatesAutoresizingMaskIntoConstraints(value):
            return ViewTranslatesAutoresizingMaskIntoConstraints(value: value)
        case let .alpha(value):
            return ViewAlpha(value: value)
        case let .backgroundColor(value):
            return ViewBackgroundColor(value: value)
        case let .clipsToBounds(value):
            return ViewClipsToBounds(value: value)
        case let .contentMode(value):
            return ViewContentMode(value: value)
        case let .isHidden(value):
            return ViewIsHidden(value: value)
        case let .isUserInteractionEnabled(value):
            return ViewIsUserInteractionEnabled(value: value)
        case let .layoutMargins(value):
            return ViewLayoutMargins(value: value)
        case let .tag(value):
            return ViewTag(value: value)
        case let .tintColor(value):
            return ViewTintColor(value: value)
        case let .borderColor(value):
            return ViewLayerBorderColor(value: value)
        case let .borderWidth(value):
            return ViewLayerBorderWidth(value: value)
        case let .cornerRadius(value):
            return ViewLayerCornerRadius(value: value)
        case let .mask(value):
            return ViewLayerMask(value: value)
        case let .maskedCorners(value):
            return ViewLayerMaskedCorners(value: value)
        case let .masksToBounds(value):
            return ViewLayerMasksToBounds(value: value)
        case let .rasterizationScale(value):
            return ViewLayerRasterizationScale(value: value)
        case let .shadowColor(value):
            return ViewLayerShadowColor(value: value)
        case let .shadowOffset(value):
            return ViewLayerShadowOffset(value: value)
        case let .shadowOpacity(value):
            return ViewLayerShadowOpacity(value: value)
        case let .shadowRadius(value):
            return ViewLayerShadowRadius(value: value)
        case let .shouldRasterize(value):
            return ViewLayerShouldRasterize(value: value)
        case let .accessibilityIdentifier(value):
            return ViewAccessibilityIdentifier(value: value)
        case let .border(value):
            return ViewLayerBorder(value: value)
        case let .shadow(value):
            return ViewLayerShadow(value: value)
        case let .tintAdjustmentMode(value):
            return ViewTintAdjustmentMode(value: value)
        }
    }

    /// Modifies the specified view by applying the attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct that represents the view's tint adjustment mode attribute.
public struct ViewTintAdjustmentMode: Attribute {
    /// The value of the tint adjustment mode.
    public var value: UIView.TintAdjustmentMode

    /// Initializes a new instance of the `ViewTintAdjustmentMode` struct.
    /// - Parameter value: The value of the tint adjustment mode.
    public init(value: UIView.TintAdjustmentMode) {
        self.value = value
    }

    /// Modifies the specified view with the tint adjustment mode value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.tintAdjustmentMode = value
    }
}

/// A struct representing an accessibility identifier attribute for a view.
public struct ViewAccessibilityIdentifier: Attribute {
    /// The value of the accessibility identifier.
    public var value: String

    /// Initializes a new instance of the `ViewAccessibilityIdentifier` struct.
    /// - Parameter value: The value of the accessibility identifier.
    public init(value: String) {
        self.value = value
    }

    /// Modifies the given view by setting its accessibility identifier to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.accessibilityIdentifier = value
    }
}

/// A struct that represents the `translatesAutoresizingMaskIntoConstraints` attribute for a view.
public struct ViewTranslatesAutoresizingMaskIntoConstraints: Attribute {
    /// The boolean value indicating whether the view should use autoresizing masks for layout.
    public let value: Bool

    /// Initializes a new instance of `ViewTranslatesAutoresizingMaskIntoConstraints`.
    /// - Parameter value: The boolean value indicating whether the view should use autoresizing masks for layout. Default value is `false`.
    public init(value: Bool = false) {
        self.value = value
    }

    /// Modifies the given view by setting its `translatesAutoresizingMaskIntoConstraints` property.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.translatesAutoresizingMaskIntoConstraints = value
    }
}

/// A struct representing the view's tint color attribute.
public struct ViewTintColor: Attribute {
    /// The value of the tint color.
    public var value: UIColor

    /// Initializes a new instance of `ViewTintColor` with the specified value.
    /// - Parameter value: The value of the tint color.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view's tint color.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        view.tintColor = value
    }
}

/// A struct that represents an attribute for setting the tag value of a UIView.
public struct ViewTag: Attribute {
    /// The value of the tag.
    public var value: Int

    /// Initializes a new instance of ViewTag with the specified value.
    /// - Parameter value: The value of the tag.
    public init(value: Int) {
        self.value = value
    }

    /// Modifies the specified view by setting its tag value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.tag = value
    }
}

/// A struct that represents the layout margins for a view.
public struct ViewLayoutMargins: Attribute {
    /// The value of the layout margins.
    public let value: UIEdgeInsets

    /// Initializes a new instance of `ViewLayoutMargins` with the specified layout margins value.
    /// - Parameter value: The layout margins value.
    public init(value: UIEdgeInsets) {
        self.value = value
    }

    /// Modifies the specified view by setting its layout margins to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layoutMargins = value
    }
}

/// A struct representing the attribute for enabling or disabling user interaction on a view.
public struct ViewIsUserInteractionEnabled: Attribute {
    /// The value indicating whether user interaction is enabled or disabled.
    public let value: Bool

    /// Initializes a new instance of the `ViewIsUserInteractionEnabled` struct.
    /// - Parameter value: The value indicating whether user interaction is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling user interaction based on the `value` property.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.isUserInteractionEnabled = value
    }
}

/// A struct representing the attribute for hiding a view.
public struct ViewIsHidden: Attribute {
    /// The value indicating whether the view should be hidden or not.
    public let value: Bool

    /// Initializes a new instance of `ViewIsHidden`.
    /// - Parameter value: The value indicating whether the view should be hidden or not.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the given view by setting its `isHidden` property based on the `value`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.isHidden = value
    }
}

/// A struct that represents an attribute for configuring the content mode of a view.
public struct ViewContentMode: Attribute {
    /// The content mode value for the view.
    public let value: UIView.ContentMode

    /// Initializes a new instance of `ViewContentMode` with the specified content mode value.
    /// - Parameter value: The content mode value for the view.
    public init(value: UIView.ContentMode) {
        self.value = value
    }

    /// Modifies the specified view by setting its content mode to the configured value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.contentMode = value
    }
}

/// A struct representing the attribute for setting the `clipsToBounds` property of a `UIView`.
public struct ViewClipsToBounds: Attribute {
    public let value: Bool

    /// Initializes a new instance of `ViewClipsToBounds` with the specified value.
    /// - Parameter value: A boolean value indicating whether the view's bounds should be clipped.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `clipsToBounds` property to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.clipsToBounds = value
    }
}

/// A struct representing the background color attribute for a view.
public struct ViewBackgroundColor: Attribute {
    /// The color value for the background.
    public let value: UIColor

    /// Initializes a `ViewBackgroundColor` instance with the specified color value.
    /// - Parameter value: The color value for the background.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the background color of a view.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        view.backgroundColor = value
    }
}

/// A struct representing the alpha attribute of a view.
public struct ViewAlpha: Attribute {
    /// The alpha value of the view.
    public let value: CGFloat

    /// Initializes a new instance of `ViewAlpha` with the specified alpha value.
    /// - Parameter value: The alpha value of the view.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting its alpha value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.alpha = value
    }
}

/// A struct representing an attribute that determines whether the view's layer should be rasterized.
public struct ViewLayerShouldRasterize: Attribute {
    /// The value indicating whether the view's layer should be rasterized.
    public var value: Bool

    /// Initializes a new instance of the `ViewLayerShouldRasterize` struct.
    /// - Parameter value: The value indicating whether the view's layer should be rasterized.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `shouldRasterize` property to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.shouldRasterize = value
    }
}

/// A struct representing the attribute for setting the shadow radius of a view's layer.
public struct ViewLayerShadowRadius: Attribute {
    /// The value of the shadow radius.
    public var value: CGFloat

    /// Initializes a new instance of `ViewLayerShadowRadius` with the specified value.
    /// - Parameter value: The value of the shadow radius.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting its layer's shadow radius to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowRadius = value
    }
}

/// A struct representing the attribute for setting the shadow opacity of a view's layer.
public struct ViewLayerShadowOpacity: Attribute {
    /// The value of the shadow opacity.
    public var value: Float

    /// Initializes a new instance of `ViewLayerShadowOpacity` with the specified value.
    /// - Parameter value: The value of the shadow opacity.
    public init(value: Float) {
        self.value = value
    }

    /// Modifies the specified view by setting its layer's shadow opacity to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowOpacity = value
    }
}

/// A struct representing the shadow offset attribute for a view's layer.
public struct ViewLayerShadowOffset: Attribute {
    /// The value of the shadow offset.
    public var value: CGSize

    /// Initializes a new `ViewLayerShadowOffset` instance with the given value.
    /// - Parameter value: The value of the shadow offset.
    public init(value: CGSize) {
        self.value = value
    }

    /// Modifies the given view's layer by setting the shadow offset to the specified value.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowOffset = value
    }
}

/// A struct representing the attribute for setting the shadow color of a view's layer.
public struct ViewLayerShadowColor: Attribute {
    /// The color value for the shadow.
    public var value: UIColor

    /// Initializes a new instance of `ViewLayerShadowColor` with the specified color value.
    /// - Parameter value: The color value for the shadow.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting its layer's shadow color to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowColor = value.cgColor
    }
}

/// Represents the values for configuring the shadow of a view layer.
public struct ViewLayerShadowValue {
    /// The color of the shadow.
    public let shadowColor: UIColor?
    
    /// The offset of the shadow.
    public let shadowOffset: CGSize?
    
    /// The opacity of the shadow.
    public let shadowOpacity: Float?
    
    /// The corner radius of the shadow.
    public let shadowCornerRadius: CGFloat?
    
    /// A Boolean value that determines whether sublayers are clipped to the layer’s bounds.
    public let masksToBounds: Bool?
    
    /// A Boolean value that determines whether the layer is rendered as a bitmap before compositing.
    public let shouldRasterize: Bool?
    
    /// The scale at which to rasterize the layer, relative to the coordinate space of the layer.
    public let rasterizationScale: CGFloat?

    /// Initializes a new instance of `ViewLayerShadowValue`.
    /// - Parameters:
    ///   - shadowColor: The color of the shadow. Default is `nil`.
    ///   - shadowOffset: The offset of the shadow. Default is `nil`.
    ///   - shadowOpacity: The opacity of the shadow. Default is `nil`.
    ///   - shadowCornerRadius: The corner radius of the shadow. Default is `nil`.
    ///   - masksToBounds: A Boolean value that determines whether sublayers are clipped to the layer’s bounds. Default is `nil`.
    ///   - shouldRasterize: A Boolean value that determines whether the layer is rendered as a bitmap before compositing. Default is `nil`.
    ///   - rasterizationScale: The scale at which to rasterize the layer, relative to the coordinate space of the layer. Default is `nil`.
    public init(
        shadowColor: UIColor? = nil,
        shadowOffset: CGSize? = nil,
        shadowOpacity: Float? = nil,
        shadowCornerRadius: CGFloat? = nil,
        masksToBounds: Bool? = nil,
        shouldRasterize: Bool? = nil,
        rasterizationScale: CGFloat? = nil
    ) {
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowCornerRadius = shadowCornerRadius
        self.masksToBounds = masksToBounds
        self.shouldRasterize = shouldRasterize
        self.rasterizationScale = rasterizationScale
    }
}

/// Represents a shadow applied to a view's layer.
public struct ViewLayerShadow: Attribute {
    public var value: ViewLayerShadowValue

    /// Initializes a `ViewLayerShadow` with the specified value.
    /// - Parameter value: The value of the shadow.
    public init(value: ViewLayerShadowValue) {
        self.value = value
    }

    /// Modifies the specified view by applying the shadow attributes.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        if let shadowColor = value.shadowColor {
            let attribute = ViewLayerShadowColor(value: shadowColor)
            attribute.modify(view: view)
        }

        if let shadowOffset = value.shadowOffset {
            let attribute = ViewLayerShadowOffset(value: shadowOffset)
            attribute.modify(view: view)
        }

        if let shadowOpacity = value.shadowOpacity {
            let attribute = ViewLayerShadowOpacity(value: shadowOpacity)
            attribute.modify(view: view)
        }

        if let shadowCornerRadius = value.shadowCornerRadius {
            let attribute = ViewLayerShadowRadius(value: shadowCornerRadius)
            attribute.modify(view: view)
        }

        if let masksToBounds = value.masksToBounds {
            let attribute = ViewLayerMasksToBounds(value: masksToBounds)
            attribute.modify(view: view)
        }

        if let shouldRasterize = value.shouldRasterize {
            let attribute = ViewLayerShouldRasterize(value: shouldRasterize)
            attribute.modify(view: view)
        }

        if let rasterizationScale = value.rasterizationScale {
            let attribute = ViewLayerRasterizationScale(value: rasterizationScale)
            attribute.modify(view: view)
        }
    }
}

/// A struct representing the attribute for setting the rasterization scale of a view's layer.
public struct ViewLayerRasterizationScale: Attribute {
    /// The value of the rasterization scale.
    public var value: CGFloat

    /// Initializes a new instance of `ViewLayerRasterizationScale` with the specified value.
    /// - Parameter value: The value of the rasterization scale.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting its layer's rasterization scale to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.rasterizationScale = value
    }
}

/// A struct representing the attribute for setting the `masksToBounds` property of a `UIView` layer.
public struct ViewLayerMasksToBounds: Attribute {
    public var value: Bool

    /// Initializes a new instance of `ViewLayerMasksToBounds` with the specified value.
    /// - Parameter value: The value to set for the `masksToBounds` property.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `masksToBounds` property to the stored value.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        view.layer.masksToBounds = value
    }
}

/// A struct representing the masked corners of a view's layer.
public struct ViewLayerMaskedCorners: Attribute {
    /// The value of the masked corners.
    public var value: CACornerMask

    /// Initializes a `ViewLayerMaskedCorners` instance with the specified value.
    /// - Parameter value: The value of the masked corners.
    public init(value: CACornerMask) {
        self.value = value
    }

    /// Modifies the specified view's layer by setting the masked corners to the stored value.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        view.layer.maskedCorners = value
    }
}

/// A struct representing a view layer mask attribute.
public struct ViewLayerMask: Attribute {
    /// The value of the layer mask.
    public var value: CALayer

    /// Initializes a new instance of the ViewLayerMask struct.
    /// - Parameter value: The value of the layer mask.
    public init(value: CALayer) {
        self.value = value
    }

    /// Modifies the given view by setting its layer mask to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.mask = value
    }
}

/// A struct representing the corner radius attribute for a view's layer.
public struct ViewLayerCornerRadius: Attribute {
    /// The value of the corner radius.
    public var value: CGFloat

    /// Initializes a new instance of `ViewLayerCornerRadius` with the given value.
    /// - Parameter value: The value of the corner radius.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting its layer's corner radius to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.cornerRadius = value
    }
}

/// A struct representing the border width attribute for a view's layer.
public struct ViewLayerBorderWidth: Attribute {
    /// The value of the border width.
    public var value: CGFloat

    /// Initializes a new instance of ViewLayerBorderWidth with the specified value.
    /// - Parameter value: The value of the border width.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting its layer's border width to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.borderWidth = value
    }
}

/// A struct representing the border color attribute for a view layer.
public struct ViewLayerBorderColor: Attribute {
    /// The color value for the border.
    public var value: UIColor

    /// Initializes a new instance of `ViewLayerBorderColor` with the specified color value.
    /// - Parameter value: The color value for the border.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting its layer's border color to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        view.layer.borderColor = value.cgColor
    }
}

/// Represents the values for configuring the border of a view layer.
public struct ViewLayerBorderValue {
    /// The corner radius of the view layer's border.
    public let cornerRadius: CGFloat?
    
    /// The width of the view layer's border.
    public let borderWidth: CGFloat?
    
    /// The color of the view layer's border.
    public let borderColor: UIColor?
    
    /// A Boolean value that determines whether the view layer's content is confined to its bounds.
    public let masksToBounds: Bool?
    
    /// Initializes a new instance of `ViewLayerBorderValue`.
    /// - Parameters:
    ///   - cornerRadius: The corner radius of the view layer's border. Default is `nil`.
    ///   - borderWidth: The width of the view layer's border. Default is `nil`.
    ///   - borderColor: The color of the view layer's border. Default is `nil`.
    ///   - masksToBounds: A Boolean value that determines whether the view layer's content is confined to its bounds. Default is `nil`.
    public init(
        cornerRadius: CGFloat? = nil,
        borderWidth: CGFloat? = nil,
        borderColor: UIColor? = nil,
        masksToBounds: Bool? = nil
    ) {
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.masksToBounds = masksToBounds
    }
}

/// Represents a border attribute for a view's layer.
public struct ViewLayerBorder: Attribute {
    public let value: ViewLayerBorderValue

    /// Initializes a new instance of `ViewLayerBorder` with the specified value.
    /// - Parameter value: The value for the border attribute.
    public init(value: ViewLayerBorderValue) {
        self.value = value
    }

    /// Modifies the specified view by applying the border attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        if let cornerRadius = value.cornerRadius {
            let viewLayerCornerRadius = ViewLayerCornerRadius(value: cornerRadius)
            viewLayerCornerRadius.modify(view: view)
        }
        if let borderWidth = value.borderWidth {
            let viewLayerBorderWidth = ViewLayerBorderWidth(value: borderWidth)
            viewLayerBorderWidth.modify(view: view)
        }
        if let borderColor = value.borderColor {
            let viewLayerBorderColor = ViewLayerBorderColor(value: borderColor)
            viewLayerBorderColor.modify(view: view)
        }
        if let masksToBounds = value.masksToBounds {
            let viewLayerMasksToBounds = ViewLayerMasksToBounds(value: masksToBounds)
            viewLayerMasksToBounds.modify(view: view)
        }
    }
}
#endif
