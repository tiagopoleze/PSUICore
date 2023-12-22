#if os(iOS)
import UIKit

/// Enum that represents the attributes for a progress view.
public enum ProgressViewAttribute: Attribute {
    /// The track tint color value.
    case trackTintColor(UIColor)
    /// The progress image value.
    case progressImage(UIImage)
    /// The track image value.
    case trackImage(UIImage)
    /// The progress tint color value.
    case progressTintColor(UIColor)
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute type.
    public var value: any Attribute {
        switch self {
        case let .trackTintColor(value):
            return ProgressViewTrackTintColor(value: value)
        case let .progressImage(value):
            return ProgressViewProgressImage(value: value)
        case let .trackImage(value):
            return ProgressViewTrackImage(value: value)
        case let .progressTintColor(value):
            return ProgressViewProgressTintColor(value: value)
        case let .view(value):
            return value.value
        }
    }

    /// Modifies the provided view by applying the attribute to a UIProgressView.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct representing the attribute for the track tint color of a `UIProgressView`.
public struct ProgressViewTrackTintColor: Attribute {
    /// The value of the track tint color.
    public var value: UIColor

    /// Initializes a `ProgressViewTrackTintColor` with the specified value.
    /// - Parameter value: The value of the track tint color.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the track tint color of a `UIProgressView`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.trackTintColor = value
    }
}

/// A struct representing an attribute for customizing the track image of a `UIProgressView`.
public struct ProgressViewTrackImage: Attribute {
    /// The custom track image for the progress view.
    public var value: UIImage

    /// Initializes a `ProgressViewTrackImage` with the specified track image.
    /// - Parameter value: The custom track image for the progress view.
    public init(value: UIImage) {
        self.value = value
    }

    /// Modifies the specified view by setting the track image to the custom image.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.trackImage = value
    }
}

/// A struct representing the attribute for modifying the progress tint color of a UIProgressView.
public struct ProgressViewProgressTintColor: Attribute {
    public var value: UIColor

    /// Initializes a `ProgressViewProgressTintColor` with the specified color value.
    /// - Parameter value: The color value to set as the progress tint color.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the specified view by setting the progress tint color to the stored value.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.progressTintColor = value
    }
}

/// A struct that represents an attribute for customizing the progress image of a UIProgressView.
public struct ProgressViewProgressImage: Attribute {
    /// The custom image to be used as the progress image.
    public var value: UIImage

    /// Initializes a new instance of `ProgressViewProgressImage`.
    /// - Parameter value: The custom image to be used as the progress image.
    public init(value: UIImage) {
        self.value = value
    }

    /// Modifies the specified view by setting the progress image to the custom image.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.progressImage = value
    }
}
#endif
