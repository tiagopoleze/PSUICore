#if os(iOS)
import UIKit

/// Enum that represents the attributes for a label.
public enum LabelAttribute: Attribute {
    /// The accessibility identifier for the label.
    case accessibility(String)
    /// The attributed text value.
    case attributedText(NSAttributedString)
    /// The font value for the label.
    case font(UIFont)
    /// The line break mode value.
    case lineBreakMode(NSLineBreakMode)
    /// The line break strategy value.
    case lineBreakStrategy(NSParagraphStyle.LineBreakStrategy)
    /// The number of lines value.
    case numberOfLines(Int)
    /// The text alignment value.
    case textAlignment(NSTextAlignment)
    /// The text color value.
    case textColor(UIColor)
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute type.
    public var value: any Attribute {
        switch self {
        case let .accessibility(value):
            return LabelAccessibility(value: value)
        case let .attributedText(value):
            return LabelAttributedText(value: value)
        case let .font(value):
            return LabelFont(value: value)
        case let .lineBreakMode(value):
            return LabelLineBreakMode(value: value)
        case let .numberOfLines(value):
            return LabelNumberOfLines(value: value)
        case let .textAlignment(value):
            return LabelTextAlignment(value: value)
        case let .textColor(value):
            return LabelTextColor(value: value)
        case let .view(value):
            return value.value
        default:
            if #available(iOS 14.0, *), case let .lineBreakStrategy(value) = self {
                return LabelLineBreakStrategy(value: value)
            }
            return EmptyAttribute()
        }
    }

    /// Modifies the provided view by applying the attribute to a UILabel.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct that represents the accessibility attributes for a UILabel.
public struct LabelAccessibility: Attribute {
    /// The accessibility identifier for the label.
    public let value: String?

    /// Initializes a new instance of `LabelAccessibility`.
    /// - Parameter value: The accessibility identifier for the label.
    public init(value: String? = nil) {
        self.value = value
    }

    /// Modifies the provided view by applying the accessibility attributes to a UILabel.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        if let value { label.accessibilityIdentifier = value }
    }
}

/// A struct representing the attribute for modifying the text color of a UILabel.
public struct LabelTextColor: Attribute {
    public let value: UIColor

    /// Initializes a new instance of `LabelTextColor` with the specified color value.
    /// - Parameter value: The color value to be applied to the text color of the label.
    public init(value: UIColor) {
        self.value = value
    }

    /// Modifies the view by setting the text color of the label to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.textColor = value
    }
}

/// A struct that represents the text alignment attribute for a UILabel.
public struct LabelTextAlignment: Attribute {
    /// The text alignment value.
    public let value: NSTextAlignment

    /// Initializes a new instance of `LabelTextAlignment` with the specified text alignment value.
    /// - Parameter value: The text alignment value.
    public init(value: NSTextAlignment) {
        self.value = value
    }

    /// Modifies the provided view by setting the text alignment of a UILabel to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.textAlignment = value
    }
}

/// A struct that represents the attribute for setting the number of lines in a UILabel.
public struct LabelNumberOfLines: Attribute {
    /// The value representing the number of lines.
    public let value: Int

    /// Initializes a new instance of `LabelNumberOfLines` with the specified value.
    /// - Parameter value: The number of lines to be set.
    public init(value: Int) {
        self.value = value
    }

    /// Modifies the provided view by setting the number of lines of a UILabel.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.numberOfLines = value
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for modifying the line break strategy of a UILabel.
public struct LabelLineBreakStrategy: Attribute {
    /// The value of the line break strategy.
    public var value: NSParagraphStyle.LineBreakStrategy

    /// Initializes a new instance of `LabelLineBreakStrategy` with the specified value.
    /// - Parameter value: The value of the line break strategy.
    public init(value: NSParagraphStyle.LineBreakStrategy) {
        self.value = value
    }

    /// Modifies the line break strategy of the specified view.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.lineBreakStrategy = value
    }
}

/// A struct that represents the line break mode for a UILabel.
public struct LabelLineBreakMode: Attribute {
    /// The line break mode value.
    public var value: NSLineBreakMode

    /// Initializes a new instance of `LabelLineBreakMode`.
    /// - Parameter value: The line break mode value.
    public init(value: NSLineBreakMode) {
        self.value = value
    }

    /// Modifies the provided view by setting the line break mode of a UILabel.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.lineBreakMode = value
    }
}

/// A struct representing the font attribute for a UILabel.
public struct LabelFont: Attribute {
    /// The font value for the attribute.
    public let value: UIFont

    /// Initializes a new instance of the `LabelFont` struct.
    /// - Parameter value: The font value for the attribute.
    public init(value: UIFont) {
        self.value = value
    }

    /// Modifies the specified view by setting the font attribute to the label.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.font = value
    }
}

/// A struct that represents an attributed text attribute for a UILabel.
public struct LabelAttributedText: Attribute {
    /// The attributed text value.
    public var value: NSAttributedString

    /// Initializes a new instance of `LabelAttributedText`.
    /// - Parameter value: The attributed text value.
    public init(value: NSAttributedString) {
        self.value = value
    }

    /// Modifies the provided view by setting the attributed text value to a UILabel.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.attributedText = value
    }
}
#endif
