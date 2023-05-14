//
//  SliderAttribute.swift
//  
//
//  Created by Tiago Ferreira on 08/05/2023.
//

#if os(iOS)
import UIKit

public enum SliderAttribute: Attribute {
    case value(Float)
    case minimumValue(Float)
    case maximumValue(Float)
    case minimumValueImage(UIImage)
    case maximumValueImage(UIImage)
    case isContinuous(Bool)
    case minimumTrackTintColor(UIColor)
    case maximumTrackTintColor(UIColor)
    case thumbTintColor(UIColor)
    case setValue(SliderSetValueValue)
    case setThumbImage(SliderSetThumbImageValue)
    case setMinimumTrackImage(SliderSetMinimumTrackImageValue)
    case setMaximumTrackImage(SliderSetMaximumTrackImageValue)
    case control(ControlAttribute)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

public struct SliderValue: Attribute {
    public var value: Float

    public init(value: Float) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.value = value
    }
}

public struct SliderMinimumValue: Attribute {
    public let value: Float

    public init(value: Float) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.minimumValue = value
    }
}

public struct SliderMaximumValue: Attribute {
    public let value: Float

    public init(value: Float) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.maximumValue = value
    }
}

public struct SliderMinimumValueImage: Attribute {
    public let value: UIImage

    public init(value: UIImage) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.minimumValueImage = value
    }
}

public struct SliderMaximumValueImage: Attribute {
    public let value: UIImage

    public init(value: UIImage) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.maximumValueImage = value
    }
}

public struct SliderIsContinuous: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.isContinuous = value
    }
}

public struct SliderMinimumTrackTintColor: Attribute {
    public let value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.minimumTrackTintColor = value
    }
}

public struct SliderMaximumTrackTintColor: Attribute {
    public let value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.maximumTrackTintColor = value
    }
}

public struct SliderThumbTintColor: Attribute {
    public let value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.thumbTintColor = value
    }
}

public struct SliderSetValue: Attribute {
    public var value: SliderSetValueValue

    public init(value: SliderSetValueValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.setValue(value.value, animated: value.animated)
    }
}
public struct SliderSetThumbImage: Attribute {
    public var value: SliderSetThumbImageValue

    public init(value: SliderSetThumbImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.setThumbImage(value.image, for: value.state)
    }
}
public struct SliderSetMinimumTrackImage: Attribute {
    public var value: SliderSetMinimumTrackImageValue

    public init(value: SliderSetMinimumTrackImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.setMinimumTrackImage(value.image, for: value.state)
    }
}
public struct SliderSetMaximumTrackImage: Attribute {
    public var value: SliderSetMaximumTrackImageValue

    public init(value: SliderSetMaximumTrackImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let slider = view as? UISlider else { return }
        slider.setMaximumTrackImage(value.image, for: value.state)
    }
}

public struct SliderSetValueValue {
    public let value: Float
    public let animated: Bool

    public init(value: Float, animated: Bool) {
        self.value = value
        self.animated = animated
    }
}
public struct SliderSetThumbImageValue {
    public let image: UIImage
    public let state: UIControl.State

    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}
public struct SliderSetMinimumTrackImageValue {
    public let image: UIImage
    public let state: UIControl.State

    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}
public struct SliderSetMaximumTrackImageValue {
    public let image: UIImage
    public let state: UIControl.State

    public init(image: UIImage, state: UIControl.State) {
        self.image = image
        self.state = state
    }
}

#endif
