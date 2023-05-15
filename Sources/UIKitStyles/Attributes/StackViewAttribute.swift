#if os(iOS)
import UIKit

public enum StackViewAttribute: Attribute {
    case alignment(UIStackView.Alignment)
    case axis(NSLayoutConstraint.Axis)
    case distribution(UIStackView.Distribution)
    case spacing(CGFloat)
    case isBaselineRelativeArrangement(Bool)
    case isLayoutMarginsRelativeArrangement(Bool)
    case base(StackViewBaseValue)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct StackViewSpacing: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.spacing = value
    }
}

// swiftlint:disable:next type_name
public struct StackViewIsLayoutMarginsRelativeArrangement: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.isLayoutMarginsRelativeArrangement = value
    }
}

public struct StackViewIsBaselineRelativeArrangement: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.isBaselineRelativeArrangement = value
    }
}

public struct StackViewDistribution: Attribute {
    public var value: UIStackView.Distribution

    public init(value: UIStackView.Distribution) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.distribution = value
    }
}

public struct StackViewBaseValue {
    public let axis: NSLayoutConstraint.Axis?
    public let alignment: UIStackView.Alignment?
    public let distribution: UIStackView.Distribution?
    public let spacing: CGFloat?

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

public struct StackViewBase: Attribute {
    public let value: StackViewBaseValue

    public init(value: StackViewBaseValue) {
        self.value = value
    }

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

public struct StackViewAxis: Attribute {
    public var value: NSLayoutConstraint.Axis

    public init(value: NSLayoutConstraint.Axis) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.axis = value
    }
}

public struct StackViewAlignment: Attribute {
    public var value: UIStackView.Alignment

    public init(value: UIStackView.Alignment) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let stackView = view as? UIStackView else { return }
        stackView.alignment = value
    }
}
#endif
