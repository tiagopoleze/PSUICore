#if os(iOS)
import UIKit

/// A Enum that represents the attributes for a UIStackView.
public enum StackViewAttribute: Attribute {
    /// The alignment of the arranged subviews perpendicular to the stack view's axis.
    case alignment(UIStackView.Alignment)
    /// The axis along which the arranged views are laid out.
    case axis(NSLayoutConstraint.Axis)
    /// The distribution of the arranged views along the stack view's axis.
    case distribution(UIStackView.Distribution)
    /// The spacing between adjacent arranged views.
    case spacing(CGFloat)
    /// A Boolean value that determines whether the stack view lays out its arranged views relative to its baseline.
    case isBaselineRelativeArrangement(Bool)
    /// A Boolean value that determines whether the stack view lays out its arranged views relative to its layout margins.
    case isLayoutMarginsRelativeArrangement(Bool)
    /// The base values for configuring a `UIStackView`.
    case base(StackViewBaseValue)
    /// A view attribute that represents the view to be modified.
    case view(ViewAttribute)

    /// The value of the attribute.
    public var value: any Attribute {
        switch self {
        case .alignment(value: let value):
            return StackViewAlignment(value: value)
        case .axis(let value):
            return StackViewAxis(value: value)
        case .distribution(let value):
            return StackViewDistribution(value: value)
        case .spacing(let value):
            return StackViewSpacing(value: value)
        case .isBaselineRelativeArrangement(let value):
            return StackViewIsBaselineRelativeArrangement(value: value)
        case .isLayoutMarginsRelativeArrangement(let value):
            return StackViewIsLayoutMarginsRelativeArrangement(value: value)
        case let .base(value):
            return StackViewBase(value: value)
        case .view(let value):
            return value.value
        }
    }

    /// Modifies the given view by applying the specified attribute.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct that represents the spacing attribute for a UIStackView.
public struct StackViewSpacing: Attribute {
    /// The value of the spacing attribute.
    public var value: CGFloat

    /// Initializes a new instance of the StackViewSpacing struct.
    /// - Parameter value: The value of the spacing attribute.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the given view by setting the spacing attribute of the UIStackView.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.spacing = value
    }
}

/// A struct that represents an attribute for setting the `isLayoutMarginsRelativeArrangement` property of a `UIStackView`.
public struct StackViewIsLayoutMarginsRelativeArrangement: Attribute {
    public var value: Bool

    /// Initializes a new instance of `StackViewIsLayoutMarginsRelativeArrangement`.
    /// - Parameter value: The value to set for the `isLayoutMarginsRelativeArrangement` property.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the provided view by setting the `isLayoutMarginsRelativeArrangement` property of a `UIStackView`.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.isLayoutMarginsRelativeArrangement = value
    }
}

/// A struct representing an attribute for configuring the `isBaselineRelativeArrangement` property of a `UIStackView`.
public struct StackViewIsBaselineRelativeArrangement: Attribute {
    public var value: Bool

    /// Initializes a new instance of `StackViewIsBaselineRelativeArrangement` with the specified value.
    /// - Parameter value: The value to set for the `isBaselineRelativeArrangement` property.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the provided view by setting its `isBaselineRelativeArrangement` property to the stored value.
    /// - Parameter view: The view to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.isBaselineRelativeArrangement = value
    }
}

/// A struct that represents an attribute for configuring the distribution of a UIStackView.
public struct StackViewDistribution: Attribute {
    public var value: UIStackView.Distribution

    /// Initializes a new instance of StackViewDistribution.
    /// - Parameter value: The distribution value to be applied to the UIStackView.
    public init(value: UIStackView.Distribution) {
        self.value = value
    }

    /// Modifies the provided view by setting its distribution to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.distribution = value
    }
}

/// Represents the base values for configuring a `UIStackView`.
public struct StackViewBaseValue {
    /// The axis along which the arranged views are laid out.
    public let axis: NSLayoutConstraint.Axis?
    
    /// The alignment of the arranged subviews perpendicular to the stack view's axis.
    public let alignment: UIStackView.Alignment?
    
    /// The distribution of the arranged views along the stack view's axis.
    public let distribution: UIStackView.Distribution?
    
    /// The spacing between adjacent arranged views.
    public let spacing: CGFloat?
    
    /// Initializes a new instance of `StackViewBaseValue`.
    ///
    /// - Parameters:
    ///   - axis: The axis along which the arranged views are laid out.
    ///   - alignment: The alignment of the arranged subviews perpendicular to the stack view's axis.
    ///   - distribution: The distribution of the arranged views along the stack view's axis.
    ///   - spacing: The spacing between adjacent arranged views.
    public init(
        axis: NSLayoutConstraint.Axis? = nil,
        alignment: UIStackView.Alignment? = nil,
        distribution: UIStackView.Distribution? = nil,
        spacing: CGFloat? = nil
    ) {
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
}

/// A struct representing the base attributes for a `UIStackView`.
public struct StackViewBase: Attribute {
    public let value: StackViewBaseValue

    public init(value: StackViewBaseValue) {
        self.value = value
    }

    /// Modifies the given `UIView` by applying the specified attributes to a `UIStackView`.
    ///
    /// - Parameter view: The `UIView` to be modified.
    public func modify<V>(view: V) where V: UIView {
        if let axis = value.axis {
            let attribute = StackViewAxis(value: axis)
            attribute.modify(view: view)
        }
        if let alignment = value.alignment {
            let attribute = StackViewAlignment(value: alignment)
            attribute.modify(view: view)
        }
        if let distribution = value.distribution {
            let attribute = StackViewDistribution(value: distribution)
            attribute.modify(view: view)
        }
        if let spacing = value.spacing {
            let attribute = StackViewSpacing(value: spacing)
            attribute.modify(view: view)
        }
    }
}

/// A struct representing the axis of a UIStackView.
public struct StackViewAxis: Attribute {
    /// The axis value of the UIStackView.
    public var value: NSLayoutConstraint.Axis

    /// Initializes a new instance of StackViewAxis with the given axis value.
    /// - Parameter value: The axis value of the UIStackView.
    public init(value: NSLayoutConstraint.Axis) {
        self.value = value
    }

    /// Modifies the given view by setting its axis to the value of the StackViewAxis.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.axis = value
    }
}

/// A struct that represents the alignment attribute for a UIStackView.
public struct StackViewAlignment: Attribute {
    /// The value of the alignment attribute.
    public var value: UIStackView.Alignment

    /// Initializes a new instance of the StackViewAlignment struct.
    /// - Parameter value: The value of the alignment attribute.
    public init(value: UIStackView.Alignment) {
        self.value = value
    }

    /// Modifies the provided view by setting its stack view alignment to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.alignment = value
    }
}
#endif
