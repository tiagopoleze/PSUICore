#if os(iOS)
import UIKit

/// A struct representing the attributes of a UISlider.
public enum SliderAttribute: Attribute {
    /// The value of the slider.
    case value(Float)
    /// The minimum value of the slider.
    case minimumValue(Float)
    /// The maximum value of the slider.
    case maximumValue(Float)
    /// The minimum value image of the slider.
    case minimumValueImage(UIImage)
    /// The maximum value image of the slider.
    case maximumValueImage(UIImage)
    /// A flag indicating whether the slider should be continuous or not.
    case isContinuous(Bool)
    /// The minimum track tint color of the slider.
    case minimumTrackTintColor(UIColor)
    /// The maximum track tint color of the slider.
    case maximumTrackTintColor(UIColor)
    /// The thumb tint color of the slider.
    case thumbTintColor(UIColor)
    /// Sets the value of the slider.
    case setValue(SliderSetValueValue)
    /// Sets the thumb image of the slider.
    case setThumbImage(SliderSetThumbImageValue)
    /// Sets the minimum track image of the slider.
    case setMinimumTrackImage(SliderSetMinimumTrackImageValue)
    /// Sets the maximum track image of the slider.
    case setMaximumTrackImage(SliderSetMaximumTrackImageValue)
    /// The control attributes of the slider.
    case control(ControlAttribute)
    /// The view attributes of the slider.
    case view(ViewAttribute)

    /// The value of the attribute.
    public var value: any Attribute {
        switch self {
        case let .value(value):
            return SliderValue(value: value)
        case let .minimumValue(value):
            return SliderMinimumValue(value: value)
        case let .maximumValue(value):
            return SliderMaximumValue(value: value)
        case let .minimumValueImage(value):
            return SliderMinimumValueImage(value: value)
        case let .maximumValueImage(value):
            return SliderMaximumValueImage(value: value)
        case let .isContinuous(value):
            return SliderIsContinuous(value: value)
        case let .minimumTrackTintColor(value):
            return SliderMinimumTrackTintColor(value: value)
        case let .maximumTrackTintColor(value):
            return SliderMaximumTrackTintColor(value: value)
        case let .thumbTintColor(value):
            return SliderThumbTintColor(value: value)
        case let .setValue(value):
            return SliderSetValue(value: value)
        case let .setThumbImage(value):
            return SliderSetThumbImage(value: value)
        case let .setMinimumTrackImage(value):
            return SliderSetMinimumTrackImage(value: value)
        case let .setMaximumTrackImage(value):
            return SliderSetMaximumTrackImage(value: value)
        case .control(let controlAttribute):
            return controlAttribute.value
        case .view(let value):
            return value.value
        }
    }

    /// Modifies the specified view by setting the value of the slider to the value of this attribute.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct representing the value of a slider.
public struct SliderValue: Attribute {
    /// The value of the slider.
    public var value: Float

    /// Initializes a new instance of `SliderValue` with the specified value.
    /// - Parameter value: The value of the slider.
    public init(value: Float) {
        self.value = value
    }

    /// Modifies the specified view by setting its slider value to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.value = value
    }
}

/// A struct representing the minimum value attribute for a slider.
public struct SliderMinimumValue: Attribute {
    /// The minimum value for the slider.
    public let value: Float

    /// Initializes a new instance of the `SliderMinimumValue` struct.
    /// - Parameter value: The minimum value for the slider.
    public init(value: Float) {
        self.value = value
    }

    /// Modifies the specified view by setting its minimum value to the value provided.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.minimumValue = value
    }
}

/// A struct representing the maximum value attribute for a slider.
public struct SliderMaximumValue: Attribute {
    /// The maximum value for the slider.
    public let value: Float

    /// Initializes a new instance of `SliderMaximumValue`.
    /// - Parameter value: The maximum value for the slider.
    public init(value: Float) {
        self.value = value
    }

    /// Modifies the specified view by setting its maximum value to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.maximumValue = value
    }
}

/// A struct representing the attribute for setting the minimum value image of a UISlider.
public struct SliderMinimumValueImage: Attribute {
    /// The image to be set as the minimum value image.
    public let value: UIImage

    /// Initializes a new instance of `SliderMinimumValueImage`.
    /// - Parameter value: The image to be set as the minimum value image.
    public init(value: UIImage) {
        self.value = value
    }

    /// Modifies the given view by setting the minimum value image of a UISlider.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.minimumValueImage = value
    }
}

/// A struct representing the attribute for setting the maximum value image of a UISlider.
public struct SliderMaximumValueImage: Attribute {
    /// The image to be set as the maximum value image.
    public let value: UIImage

    /// Initializes a new instance of `SliderMaximumValueImage`.
    /// - Parameter value: The image to be set as the maximum value image.
    public init(value: UIImage) {
        self.value = value
    }

    /// Modifies the specified view by setting the maximum value image of a UISlider.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.maximumValueImage = value
    }
}

/// A struct representing the attribute for setting the continuous behavior of a slider.
public struct SliderIsContinuous: Attribute {
    public let value: Bool

    /// Initializes a `SliderIsContinuous` instance with the specified value.
    /// - Parameter value: The boolean value indicating whether the slider should be continuous or not.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `isContinuous` property to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.isContinuous = value
    }
}

/// A struct representing the attribute for setting the minimum track tint color of a UISlider.
public struct SliderMinimumTrackTintColor: Attribute {
    public let value: UIColor

    /// Initializes a `SliderMinimumTrackTintColor` with the specified color value.
    /// - Parameter value: The color value to set as the minimum track tint color.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the minimum track tint color of a UISlider.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.minimumTrackTintColor = value
    }
}

/// A struct representing the attribute for setting the maximum track tint color of a slider.
public struct SliderMaximumTrackTintColor: Attribute {
    public let value: UIColor

    /// Initializes a `SliderMaximumTrackTintColor` with the specified color value.
    /// - Parameter value: The color value to set as the maximum track tint color.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the maximum track tint color of a slider.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.maximumTrackTintColor = value
    }
}

/// A struct representing the attribute for customizing the thumb tint color of a slider.
public struct SliderThumbTintColor: Attribute {
    /// The value of the thumb tint color.
    public let value: UIColor

    /// Initializes a `SliderThumbTintColor` with the specified value.
    /// - Parameter value: The value of the thumb tint color.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the thumb tint color of a slider.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.thumbTintColor = value
    }
}

/// A struct that represents an attribute for setting the value of a UISlider.
public struct SliderSetValue: Attribute {
    /// The value to set on the UISlider.
    public var value: SliderSetValueValue

    /// Initializes a new instance of `SliderSetValue`.
    /// - Parameter value: The value to set on the UISlider.
    public init(value: SliderSetValueValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the value of the UISlider.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.setValue(value.value, animated: value.animated)
    }
}
/// A struct that represents an attribute for setting the thumb image of a slider.
public struct SliderSetThumbImage: Attribute {
    /// The value of the attribute.
    public var value: SliderSetThumbImageValue

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value of the attribute.
    public init(value: SliderSetThumbImageValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the thumb image of a slider.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.setThumbImage(value.image, for: value.state)
    }
}
/// A struct that represents an attribute for setting the minimum track image of a UISlider.
public struct SliderSetMinimumTrackImage: Attribute {
    /// The value of the attribute.
    public var value: SliderSetMinimumTrackImageValue

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value of the attribute.
    public init(value: SliderSetMinimumTrackImageValue) {
        self.value = value
    }

    /// Modifies the specified view by setting the minimum track image of a UISlider.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.setMinimumTrackImage(value.image, for: value.state)
    }
}
/// A struct that represents an attribute for setting the maximum track image of a slider.
public struct SliderSetMaximumTrackImage: Attribute {
    /// The value of the attribute.
    public var value: SliderSetMaximumTrackImageValue

    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: SliderSetMaximumTrackImageValue) {
        self.value = value
    }

    /// Modifies the given view by setting the maximum track image of a slider.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let slider = view as? UISlider else { return }
        slider.setMaximumTrackImage(value.image, for: value.state)
    }
}

/// Represents a value and animation flag used to set the value of a slider.
public struct SliderSetValueValue {
    /// The value to set on the slider.
    public let value: Float
    /// A flag indicating whether the value change should be animated.
    public let animated: Bool

    /// Initializes a new instance of `SliderSetValueValue`.
    /// - Parameters:
    ///   - value: The value to set on the slider.
    ///   - animated: A flag indicating whether the value change should be animated.
    public init(value: Float, animated: Bool) {
        self.value = value
        self.animated = animated
    }
}
/// Represents a value used to set the thumb image for a slider control.
public struct SliderSetThumbImageValue {
    /// The image to be set as the thumb image.
    public let image: UIImage
    /// The state for which the thumb image should be set.
    public let state: UIControl.State

    /// Initializes a new instance of `SliderSetThumbImageValue`.
    /// - Parameters:
    ///   - image: The image to be set as the thumb image.
    ///   - state: The state for which the thumb image should be set.
    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}
/// Represents a value used to set the minimum track image of a slider control.
public struct SliderSetMinimumTrackImageValue {
    /// The image to be set as the minimum track image.
    public let image: UIImage
    /// The state for which the minimum track image should be set.
    public let state: UIControl.State

    /// Initializes a new instance of `SliderSetMinimumTrackImageValue`.
    /// - Parameters:
    ///   - image: The image to be set as the minimum track image.
    ///   - state: The state for which the minimum track image should be set.
    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}
/// Represents a value used to set the maximum track image of a slider control.
public struct SliderSetMaximumTrackImageValue {
    /// The image to be set as the maximum track image.
    public let image: UIImage
    /// The state for which the maximum track image should be set.
    public let state: UIControl.State

    /// Initializes a new instance of `SliderSetMaximumTrackImageValue`.
    /// - Parameters:
    ///   - image: The image to be set as the maximum track image.
    ///   - state: The state for which the maximum track image should be set.
    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}

#endif
