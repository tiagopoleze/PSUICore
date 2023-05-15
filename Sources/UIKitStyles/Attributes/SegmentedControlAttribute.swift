#if os(iOS)
import UIKit

public enum SegmentedControlAttribute: Attribute {
    case isMomentary(Bool)
    case apportionsSegmentWidthsByContent(Bool)
    case selectedSegmentIndex(Int)
    case selectedSegmentTintColor(UIColor)
    case setDividerImage(SegmentedControlSetDividerImageValue)
    case setContentPositionAdjustment(SegmentedControlSetContentPositionAdjustmentValue)
//    case insertSegmentAction(SegmentedControlInsertSegmentActionValue)
    case insertSegmentTitle(SegmentedControlInsertSegmentTitleValue)
    case insertSegmentImage(SegmentedControlInsertSegmentImageValue)
    case setBackgroundImage(SegmentedControlSetBackgroundImageValue)
    case control(ControlAttribute)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case .isMomentary(let bool):
            return SegmentedControlIsMomentary(value: bool)
        case .apportionsSegmentWidthsByContent(let bool):
            return SegmentedControlApportionsSegmentWidthsByContent(value: bool)
        case .selectedSegmentIndex(let int):
            return SegmentedControlSelectedSegmentIndex(value: int)
        case .selectedSegmentTintColor(let uIColor):
            if #available(iOS 13.0, *) {
                return SegmentedControlSelectedSegmentTintColor(value: uIColor)
            } else {
                return EmptyAttribute()
            }
        case .setDividerImage(let segmentedControlSetDividerImageValue):
            return SegmentedControlSetDividerImage(value: segmentedControlSetDividerImageValue)
        case .setContentPositionAdjustment(let value):
            return SegmentedControlSetContentPositionAdjustment(value: value)
//        case .insertSegmentAction(let segmentedControlInsertSegmentActionValue):
//            return SegmentedControlInsertSegmentAction(value: segmentedControlInsertSegmentActionValue)
        case .insertSegmentTitle(let segmentedControlInsertSegmentTitleValue):
            return SegmentedControlInsertSegmentTitle(value: segmentedControlInsertSegmentTitleValue)
        case .insertSegmentImage(let segmentedControlInsertSegmentImageValue):
            return SegmentedControlInsertSegmentImage(value: segmentedControlInsertSegmentImageValue)
        case .setBackgroundImage(let segmentedControlSetBackgroundImageValue):
            return SegmentedControlSetBackgroundImage(value: segmentedControlSetBackgroundImageValue)
        case .control(let controlAttribute):
            return controlAttribute.value
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

public struct SegmentedControlIsMomentary: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.isMomentary = value
    }
}

// swiftlint:disable:next type_name
public struct SegmentedControlApportionsSegmentWidthsByContent: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.apportionsSegmentWidthsByContent = value
    }
}
public struct SegmentedControlSelectedSegmentIndex: Attribute {
    public let value: Int

    public init(value: Int) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.selectedSegmentIndex = value
    }
}
@available(iOS 13.0, *)
public struct SegmentedControlSelectedSegmentTintColor: Attribute {
    public let value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.selectedSegmentTintColor = value
    }
}

@available(iOS 14.0, *)
public struct SegmentedControlInsertSegmentAction: Attribute {
    public var value: SegmentedControlInsertSegmentActionValue

    public init(value: SegmentedControlInsertSegmentActionValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.insertSegment(action: value.action, at: value.segment, animated: value.animated)
    }
}

@available(iOS 13.0, *)
public struct SegmentedControlInsertSegmentActionValue {
    public let action: UIAction
    public let segment: Int
    public let animated: Bool

    public init(action: UIAction, segment: Int, animated: Bool) {
        self.action = action
        self.segment = segment
        self.animated = animated
    }
}

public struct SegmentedControlInsertSegmentTitle: Attribute {
    public var value: SegmentedControlInsertSegmentTitleValue

    public init(value: SegmentedControlInsertSegmentTitleValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.insertSegment(withTitle: value.title, at: value.segment, animated: value.animated)
    }
}

public struct SegmentedControlInsertSegmentTitleValue {
    public let title: String
    public let segment: Int
    public let animated: Bool

    public init(title: String, segment: Int, animated: Bool) {
        self.title = title
        self.segment = segment
        self.animated = animated
    }
}

public struct SegmentedControlInsertSegmentImage: Attribute {
    public var value: SegmentedControlInsertSegmentImageValue

    public init(value: SegmentedControlInsertSegmentImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.insertSegment(with: value.image, at: value.segment, animated: value.animated)
    }
}

public struct SegmentedControlInsertSegmentImageValue {
    public let image: UIImage
    public let segment: Int
    public let animated: Bool

    public init(image: UIImage, segment: Int, animated: Bool) {
        self.image = image
        self.segment = segment
        self.animated = animated
    }
}

public struct SegmentedControlSetBackgroundImage: Attribute {
    public var value: SegmentedControlSetBackgroundImageValue

    public init(value: SegmentedControlSetBackgroundImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.setBackgroundImage(value.backgroundImage, for: value.state, barMetrics: value.barMetrics)
    }
}

public struct SegmentedControlSetBackgroundImageValue {
    public let backgroundImage: UIImage
    public let state: UIControl.State
    public let barMetrics: UIBarMetrics

    public init(backgroundImage: UIImage, state: UIControl.State, barMetrics: UIBarMetrics) {
        self.backgroundImage = backgroundImage
        self.state = state
        self.barMetrics = barMetrics
    }
}

public struct SegmentedControlSetDividerImage: Attribute {
    public var value: SegmentedControlSetDividerImageValue

    public init(value: SegmentedControlSetDividerImageValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.setDividerImage(
            value.dividerImage,
            forLeftSegmentState: value.leftState,
            rightSegmentState: value.rightState,
            barMetrics: value.barMetrics
        )
    }
}

public struct SegmentedControlSetDividerImageValue {
    public let dividerImage: UIImage
    public let leftState: UIControl.State
    public let rightState: UIControl.State
    public let barMetrics: UIBarMetrics

    public init(
        dividerImage: UIImage,
        leftState: UIControl.State,
        rightState: UIControl.State,
        barMetrics: UIBarMetrics
    ) {
        self.dividerImage = dividerImage
        self.leftState = leftState
        self.rightState = rightState
        self.barMetrics = barMetrics
    }
}

// swiftlint:disable:next type_name
public struct SegmentedControlSetContentPositionAdjustment: Attribute {
    public var value: SegmentedControlSetContentPositionAdjustmentValue

    public init(value: SegmentedControlSetContentPositionAdjustmentValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.setContentPositionAdjustment(
            value.adjustment,
            forSegmentType: value.leftCenterRightOrAlone,
            barMetrics: value.barMetrics
        )
    }
}

// swiftlint:disable:next type_name
public struct SegmentedControlSetContentPositionAdjustmentValue {
    public let adjustment: UIOffset
    public let leftCenterRightOrAlone: UISegmentedControl.Segment
    public let barMetrics: UIBarMetrics

    public init(adjustment: UIOffset, leftCenterRightOrAlone: UISegmentedControl.Segment, barMetrics: UIBarMetrics) {
        self.adjustment = adjustment
        self.leftCenterRightOrAlone = leftCenterRightOrAlone
        self.barMetrics = barMetrics
    }
}
#endif
