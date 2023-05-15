#if os(iOS)
import UIKit

// swiftlint:disable file_length
public enum ViewAttribute: Attribute {
    // swiftlint:disable:next identifier_name
    case translatesAutoresizingMaskIntoConstraints(Bool)
    case alpha(CGFloat)
    case backgroundColor(UIColor)
    case clipsToBounds(Bool)
    case contentMode(UIView.ContentMode)
    case isHidden(Bool)
    case isUserInteractionEnabled(Bool)
    case layoutMargins(UIEdgeInsets)
    case tag(Int)
    case tintColor(UIColor)
    case borderColor(UIColor)
    case borderWidth(CGFloat)
    case cornerRadius(CGFloat)
    case mask(CALayer)
    case maskedCorners(CACornerMask)
    case masksToBounds(Bool)
    case rasterizationScale(CGFloat)
    case shadowColor(UIColor)
    case shadowOffset(CGSize)
    case shadowOpacity(Float)
    case shadowRadius(CGFloat)
    case shouldRasterize(Bool)
    case accessibilityIdentifier(String)
    case tintAdjustmentMode(UIView.TintAdjustmentMode)
    case border(ViewLayerBorderValue)
    case shadow(ViewLayerShadowValue)

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

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct ViewTintAdjustmentMode: Attribute {
    public var value: UIView.TintAdjustmentMode

    public init(value: UIView.TintAdjustmentMode) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.tintAdjustmentMode = value
    }
}

public struct ViewAccessibilityIdentifier: Attribute {
    public var value: String

    public init(value: String) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.accessibilityIdentifier = value
    }
}

// swiftlint:disable:next type_name
public struct ViewTranslatesAutoresizingMaskIntoConstraints: Attribute {
    public let value: Bool

    public init(value: Bool = false) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.translatesAutoresizingMaskIntoConstraints = value
    }
}

public struct ViewTintColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.tintColor = value
    }
}

public struct ViewTag: Attribute {
    public var value: Int

    public init(value: Int) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.tag = value
    }
}

public struct ViewLayoutMargins: Attribute {
    public let value: UIEdgeInsets

    public init(value: UIEdgeInsets) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layoutMargins = value
    }
}

public struct ViewIsUserInteractionEnabled: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.isUserInteractionEnabled = value
    }
}

public struct ViewIsHidden: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.isHidden = value
    }
}

public struct ViewContentMode: Attribute {
    public let value: UIView.ContentMode

    public init(value: UIView.ContentMode) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.contentMode = value
    }
}

public struct ViewClipsToBounds: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.clipsToBounds = value
    }
}

public struct ViewBackgroundColor: Attribute {
    public let value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.backgroundColor = value
    }
}

public struct ViewAlpha: Attribute {
    public let value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.alpha = value
    }
}

public struct ViewLayerShouldRasterize: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.shouldRasterize = value
    }
}

public struct ViewLayerShadowRadius: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowRadius = value
    }
}

public struct ViewLayerShadowOpacity: Attribute {
    public var value: Float

    public init(value: Float) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowOpacity = value
    }
}

public struct ViewLayerShadowOffset: Attribute {
    public var value: CGSize

    public init(value: CGSize) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowOffset = value
    }
}

public struct ViewLayerShadowColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.shadowColor = value.cgColor
    }
}

public struct ViewLayerShadowValue {
    public let shadowColor: UIColor?
    public let shadowOffset: CGSize?
    public let shadowOpacity: Float?
    public let shadowCornerRadius: CGFloat?
    public let masksToBounds: Bool?
    public let shouldRasterize: Bool?
    public let rasterizationScale: CGFloat?

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

public struct ViewLayerShadow: Attribute {
    public var value: ViewLayerShadowValue

    public init(value: ViewLayerShadowValue) {
        self.value = value
    }

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

public struct ViewLayerRasterizationScale: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.rasterizationScale = value
    }
}

public struct ViewLayerMasksToBounds: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.masksToBounds = value
    }
}

public struct ViewLayerMaskedCorners: Attribute {
    public var value: CACornerMask

    public init(value: CACornerMask) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.maskedCorners = value
    }
}

public struct ViewLayerMask: Attribute {
    public var value: CALayer

    public init(value: CALayer) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.mask = value
    }
}

public struct ViewLayerCornerRadius: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.cornerRadius = value
    }
}

public struct ViewLayerBorderWidth: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.borderWidth = value
    }
}

public struct ViewLayerBorderColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        view.layer.borderColor = value.cgColor
    }
}

public struct ViewLayerBorderValue {
    public let cornerRadius: CGFloat?
    public let borderWidth: CGFloat?
    public let borderColor: UIColor?
    public let masksToBounds: Bool?

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

public struct ViewLayerBorder: Attribute {
    public let value: ViewLayerBorderValue

    public init(value: ViewLayerBorderValue) {
        self.value = value
    }

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
