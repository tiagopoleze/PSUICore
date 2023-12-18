#if os(iOS)
import UIKit

/// A struct that represents an attribute for a button.
public enum ButtonAttribute: Attribute {
    /// The accessibility identifier for the button.
    case accessibility(String)
    /// Set the Image of the button.
    case setImage(ButtonSetImageValue)
    /// Set the title of the button.
    case setTitle(ButtonSetTitleValue)
    /// Set the title color of the button.
    case setTitleColor(ButtonSetTitleColorValue)
    /// Set the attributed title of the button.
    case setAttributedTitle(ButtonSetAttributedTitleValue)
    /// Set the background image of the button.
    case setBackgroundImage(ButtonSetBackgroundImageValue)
    /// Set the shadow color of the button's title.
    case setTitleShadowColor(ButtonSetTitleShadowColorValue)
    /// Set the preferred symbol configuration of the button.
    case changesSelectionAsPrimaryAction(Bool)
    /// Check if the button is pointer interaction enabled.
    case isPointerInteractionEnabled(Bool)
    /// Change the control attributes of the button.
    case control(ControlAttribute)
    /// Set the Title Label attributes of the button.
    case titleLabel(LabelAttribute)
    /// Set the Image View attributes of the button.
    case imageView(ImageViewAttribute)
    /// Set the View attributes of the button.
    case view(ViewAttribute)

    /// The value of the attribute.
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

    /// Modifies the specified view by applying the button attribute.
    /// - Parameter view: The view to be modified.
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

/// A struct that represents the accessibility attributes for a button.
public struct ButtonAccessibility: Attribute {
    public let value: String

    /// Initializes a new instance of `ButtonAccessibility` with the specified value.
    /// - Parameter value: The accessibility identifier value for the button.
    public init(value: String) {
        self.value = value
    }

    /// Modifies the specified view to apply the accessibility attributes for the button.
    /// - Parameter view: The view to be modified.
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
/// A struct that represents an attribute for a button to change the selection as the primary action.
public struct ButtonChangesSelectionAsPrimaryAction: Attribute {
    /// The value of the attribute.
    public var value: Bool

    /// Initializes a new instance of `ButtonChangesSelectionAsPrimaryAction`.
    /// - Parameter value: A boolean value indicating whether the button should change the selection as the primary action.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the given view by setting the `changesSelectionAsPrimaryAction` property of the button.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.changesSelectionAsPrimaryAction = value
    }
}

/// A value that represents the shadow color for setting the title of a button.
public struct ButtonSetTitleShadowColorValue {
    /// The color of the shadow.
    public let color: UIColor
    /// The state of the button for which the shadow color is applied.
    public let state: UIControl.State

    /// Initializes a new instance of `ButtonSetTitleShadowColorValue`.
    /// - Parameters:
    ///   - color: The color of the shadow.
    ///   - state: The state of the button for which the shadow color is applied.
    public init(color: UIColor, state: UIControl.State) {
        self.color = color
        self.state = state
    }
}

/// A struct representing an attribute for setting the shadow color of a button's title.
public struct ButtonSetTitleShadowColor: Attribute {
    /// The value of the button's title shadow color.
    public var value: ButtonSetTitleShadowColorValue

    /// Initializes a new instance of `ButtonSetTitleShadowColor`.
    /// - Parameter value: The value of the button's title shadow color.
    public init(value: ButtonSetTitleShadowColorValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the shadow color of the button's title.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setTitleShadowColor(value.color, for: value.state)
    }
}

/// Represents the value for setting the title color of a button.
public struct ButtonSetTitleColorValue {
    /// The color to set as the title color.
    public let color: UIColor
    /// The state for which the title color should be set.
    public let state: UIControl.State

    /// Initializes a new instance of `ButtonSetTitleColorValue`.
    /// - Parameters:
    ///   - color: The color to set as the title color.
    ///   - state: The state for which the title color should be set. Default value is `.normal`.
    public init(
        color: UIColor,
        state: UIControl.State = .normal
    ) {
        self.color = color
        self.state = state
    }
}

/// A struct that represents an attribute for setting the title color of a UIButton.
public struct ButtonSetTitleColor: Attribute {
    /// The value of the title color.
    public let value: ButtonSetTitleColorValue

    /// Initializes a new instance of `ButtonSetTitleColor`.
    /// - Parameter value: The value of the title color.
    public init(value: ButtonSetTitleColorValue) {
        self.value = value
    }

    /// Modifies the given view by setting the title color of a UIButton.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setTitleColor(value.color, for: value.state)
    }
}

/// A value representing the title and state of a button.
public struct ButtonSetTitleValue {
    /// The text of the button title.
    public let text: String
    /// The state of the button.
    public let state: UIControl.State

    /// Initializes a new instance of `ButtonSetTitleValue`.
    /// - Parameters:
    ///   - text: The text of the button title.
    ///   - state: The state of the button. Default value is `.normal`.
    public init(
        text: String,
        state: UIControl.State = .normal
    ) {
        self.text = text
        self.state = state
    }
}

/// A struct that represents an attribute for setting the title of a UIButton.
public struct ButtonSetTitle: Attribute {
    /// The value of the title to be set.
    public var value: ButtonSetTitleValue

    /// Initializes a new instance of `ButtonSetTitle`.
    /// - Parameter value: The value of the title to be set.
    public init(value: ButtonSetTitleValue) {
        self.value = value
    }

    /// Modifies the given view by setting the title of a UIButton.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setTitle(value.text, for: value.state)
    }
}

@available(iOS 13.0, *)
/// A value type that represents the preferred symbol configuration for a button.
public struct ButtonSetPreferredSymbolConfigurationValue {
    /// The preferred symbol configuration for the button.
    public let configuration: UIImage.SymbolConfiguration
    /// The state of the button.
    public let state: UIControl.State

    /// Initializes a new instance of `ButtonSetPreferredSymbolConfigurationValue`.
    /// - Parameters:
    ///   - configuration: The preferred symbol configuration for the button.
    ///   - state: The state of the button.
    public init(configuration: UIImage.SymbolConfiguration, state: UIControl.State) {
        self.configuration = configuration
        self.state = state
    }
}

@available(iOS 13.0, *)
/// A struct that represents an attribute for setting the preferred symbol configuration of a button.
public struct ButtonSetPreferredSymbolConfiguration: Attribute {
    /// The value of the preferred symbol configuration.
    public var value: ButtonSetPreferredSymbolConfigurationValue

    /// Initializes a new instance of the `ButtonSetPreferredSymbolConfiguration` struct.
    /// - Parameter value: The value of the preferred symbol configuration.
    public init(value: ButtonSetPreferredSymbolConfigurationValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the preferred symbol configuration of a button.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setPreferredSymbolConfiguration(value.configuration, forImageIn: value.state)
    }
}

/// Represents a value for setting the image of a button.
public struct ButtonSetImageValue {
    /// The image to be set.
    public let image: UIImage
    /// The state of the button for which the image should be set.
    public let state: UIControl.State

    /// Initializes a new instance of `ButtonSetImageValue`.
    /// - Parameters:
    ///   - image: The image to be set.
    ///   - state: The state of the button for which the image should be set. Default value is `.normal`.
    public init(
        image: UIImage,
        state: UIControl.State = .normal
    ) {
        self.image = image
        self.state = state
    }
}

/// A struct that represents an attribute for setting the image of a button.
public struct ButtonSetImage: Attribute {
    /// The value of the button image attribute.
    public let value: ButtonSetImageValue

    /// Initializes a new instance of the `ButtonSetImage` struct.
    /// - Parameter value: The value of the button image attribute.
    public init(value: ButtonSetImageValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the image of a button.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setImage(value.image, for: value.state)
    }
}

/// A value type that represents the background image for a button and its corresponding control state.
public struct ButtonSetBackgroundImageValue {
    /// The image to be set as the background image.
    public let image: UIImage
    /// The control state for which the background image should be set.
    public let state: UIControl.State

    /// Initializes a new instance of `ButtonSetBackgroundImageValue`.
    /// - Parameters:
    ///   - image: The image to be set as the background image.
    ///   - state: The control state for which the background image should be set.
    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}

/// A struct that represents an attribute for setting the background image of a UIButton.
public struct ButtonSetBackgroundImage: Attribute {
    /// The value of the background image attribute.
    public var value: ButtonSetBackgroundImageValue

    /// Initializes a new instance of the ButtonSetBackgroundImage struct.
    /// - Parameter value: The value of the background image attribute.
    public init(value: ButtonSetBackgroundImageValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the background image of a UIButton.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setBackgroundImage(value.image, for: value.state)
    }
}

/// A value type that represents the attributed title and state for a button.
public struct ButtonSetAttributedTitleValue {
    /// The attributed title for the button.
    public let title: NSAttributedString
    
    /// The state for which the attributed title is applied.
    public let state: UIControl.State

    /// Initializes a new instance of `ButtonSetAttributedTitleValue`.
    /// - Parameters:
    ///   - title: The attributed title for the button.
    ///   - state: The state for which the attributed title is applied.
    public init(title: NSAttributedString, state: UIControl.State) {
        self.title = title
        self.state = state
    }
}

/// A struct that represents an attribute for setting the attributed title of a button.
public struct ButtonSetAttributedTitle: Attribute {
    /// The value of the attribute.
    public var value: ButtonSetAttributedTitleValue

    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: ButtonSetAttributedTitleValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the attributed title of a button.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.setAttributedTitle(value.title, for: value.state)
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for configuring the role of a UIButton.
public struct ButtonRole: Attribute {
    /// The value of the attribute.
    public var value: UIButton.Role

    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: UIButton.Role) {
        self.value = value
    }

    /// Modifies the given view by setting the role of a UIButton.
    ///
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.role = value
    }
}

/// A struct representing an attribute that enables or disables pointer interaction for a button.
@available(iOS 13.4, *)
public struct ButtonIsPointerInteractionEnabled: Attribute {
    /// The value indicating whether pointer interaction is enabled or disabled.
    public var value: Bool

    /// Initializes a new instance of the `ButtonIsPointerInteractionEnabled` struct.
    /// - Parameter value: The value indicating whether pointer interaction is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling pointer interaction for a button.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.isPointerInteractionEnabled = value
    }
}

/// A struct that represents the preferred menu element order for a button.
@available(iOS 16.0, *)
public struct ButtonPreferredMenuElementOrder: Attribute {
    /// The value representing the preferred menu element order.
    public var value: UIContextMenuConfiguration.ElementOrder

    /// Initializes a `ButtonPreferredMenuElementOrder` with the specified value.
    /// - Parameter value: The value representing the preferred menu element order.
    public init(value: UIContextMenuConfiguration.ElementOrder) {
        self.value = value
    }

    /// Modifies the specified view by setting the preferred menu element order of a button.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let button = view as? UIButton else { return }
        button.preferredMenuElementOrder = value
    }
}
#endif
