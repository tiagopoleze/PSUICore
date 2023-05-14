#if os(iOS)
import UIKit

public enum ButtonAttribute: Attribute {
    case accessibility(String)
    case setImage(ButtonSetImageValue)
    case setTitle(ButtonSetTitleValue)
    case setTitleColor(ButtonSetTitleColorValue)
    case setAttributedTitle(ButtonSetAttributedTitleValue)
    case setBackgroundImage(ButtonSetBackgroundImageValue)
    case setTitleShadowColor(ButtonSetTitleShadowColorValue)
    case changesSelectionAsPrimaryAction(Bool)
    case isPointerInteractionEnabled(Bool)
    case control(ControlAttribute)
    case titleLabel(LabelAttribute)
    case imageView(ImageViewAttribute)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case let .accessibility(value):
            return ButtonAccessibility(value: value)
        case let .control(value):
            return value.value
        case let .setImage(value):
            return ButtonSetImage(value: value)
        case let .setTitle(value):
            return ButtonSetTitle(value: value)
        case let .setTitleColor(value):
            return ButtonSetTitleColor(value: value)
        case let .setAttributedTitle(value):
            return ButtonSetAttributedTitle(value: value)
        case let .setBackgroundImage(value):
            return ButtonSetBackgroundImage(value: value)
        case let .setTitleShadowColor(value):
            return ButtonSetTitleShadowColor(value: value)
        case let .titleLabel(value):
            return value.value
        case let .imageView(value):
            return value.value
        case let .view(value):
            return value.value
        default:
            if #available(iOS 15, *), case let .changesSelectionAsPrimaryAction(value) = self {
                return ButtonChangesSelectionAsPrimaryAction(value: value)
            } else if #available(iOS 13.4, *), case let .isPointerInteractionEnabled(value) = self {
                return ButtonIsPointerInteractionEnabled(value: value)
            } else {
                return EmptyAttribute()
            }
        }
    }

    public func modify<V>(view: V) where V: UIView {
        switch self {
        case let .imageView(value):
            guard let button = view as? UIButton, let imageView = button.imageView else { return }
            value.modify(view: imageView)
        case let .titleLabel(value):
            guard let button = view as? UIButton, let titleLabel = button.titleLabel else { return }
            value.modify(view: titleLabel)
        default:
            value.modify(view: view)
        }
    }
}

public struct ButtonAccessibility: Attribute {
    public let value: String

    public init(value: String) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton,
              let label = button.titleLabel else { return }
        let labelAccessibility = LabelAccessibility()
        labelAccessibility.modify(view: label)
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.accessibilityIdentifier = value
    }
}

@available(iOS 15.0, *)
public struct ButtonChangesSelectionAsPrimaryAction: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.changesSelectionAsPrimaryAction = value
    }
}

public struct ButtonSetTitleShadowColorValue {
    public let color: UIColor
    public let state: UIControl.State

    public init(color: UIColor, state: UIControl.State) {
        self.color = color
        self.state = state
    }
}

public struct ButtonSetTitleShadowColor: Attribute {
    public var value: ButtonSetTitleShadowColorValue

    public init(value: ButtonSetTitleShadowColorValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setTitleShadowColor(value.color, for: value.state)
    }
}

public struct ButtonSetTitleColorValue {
    public let color: UIColor
    public let state: UIControl.State

    public init(
        color: UIColor,
        state: UIControl.State = .normal
    ) {
        self.color = color
        self.state = state
    }
}

public struct ButtonSetTitleColor: Attribute {
    public let value: ButtonSetTitleColorValue

    public init(value: ButtonSetTitleColorValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setTitleColor(value.color, for: value.state)
    }
}

public struct ButtonSetTitleValue {
    public let text: String
    public let state: UIControl.State

    public init(
        text: String,
        state: UIControl.State = .normal
    ) {
        self.text = text
        self.state = state
    }
}

public struct ButtonSetTitle: Attribute {
    public var value: ButtonSetTitleValue

    public init(value: ButtonSetTitleValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setTitle(value.text, for: value.state)
    }
}

@available(iOS 13.0, *)
// swiftlint:disable:next type_name
public struct ButtonSetPreferredSymbolConfigurationValue {
    public let configuration: UIImage.SymbolConfiguration
    public let state: UIControl.State

    public init(configuration: UIImage.SymbolConfiguration, state: UIControl.State) {
        self.configuration = configuration
        self.state = state
    }
}

@available(iOS 13.0, *)
public struct ButtonSetPreferredSymbolConfiguration: Attribute {
    public var value: ButtonSetPreferredSymbolConfigurationValue

    public init(value: ButtonSetPreferredSymbolConfigurationValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setPreferredSymbolConfiguration(value.configuration, forImageIn: value.state)
    }
}

public struct ButtonSetImageValue {
    public let image: UIImage
    public let state: UIControl.State

    public init(
        image: UIImage,
        state: UIControl.State = .normal
    ) {
        self.image = image
        self.state = state
    }
}

public struct ButtonSetImage: Attribute {
    public let value: ButtonSetImageValue

    public init(value: ButtonSetImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setImage(value.image, for: value.state)
    }
}

public struct ButtonSetBackgroundImageValue {
    public let image: UIImage
    public let state: UIControl.State

    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}

public struct ButtonSetBackgroundImage: Attribute {
    public var value: ButtonSetBackgroundImageValue

    public init(value: ButtonSetBackgroundImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setBackgroundImage(value.image, for: value.state)
    }
}

public struct ButtonSetAttributedTitleValue {
    public let title: NSAttributedString
    public let state: UIControl.State

    public init(title: NSAttributedString, state: UIControl.State) {
        self.title = title
        self.state = state
    }
}

public struct ButtonSetAttributedTitle: Attribute {
    public var value: ButtonSetAttributedTitleValue

    public init(value: ButtonSetAttributedTitleValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setAttributedTitle(value.title, for: value.state)
    }
}

@available(iOS 14.0, *)
public struct ButtonRole: Attribute {
    public var value: UIButton.Role

    public init(value: UIButton.Role) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.role = value
    }
}

@available(iOS 13.4, *)
public struct ButtonIsPointerInteractionEnabled: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.isPointerInteractionEnabled = value
    }
}

@available(iOS 16.0, *)
public struct ButtonPreferredMenuElementOrder: Attribute {
    public var value: UIContextMenuConfiguration.ElementOrder

    public init(value: UIContextMenuConfiguration.ElementOrder) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.preferredMenuElementOrder = value
    }
}
#endif
