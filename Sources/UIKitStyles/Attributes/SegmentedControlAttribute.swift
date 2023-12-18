#if os(iOS)
import UIKit

/// Enum that represents the attributes for a segmented control.
public enum SegmentedControlAttribute: Attribute {
    /// The value indicating whether the segmented control is momentary.
    case isMomentary(Bool)
    /// The value indicating whether the segment widths should be apportioned by content.
    case apportionsSegmentWidthsByContent(Bool)
    /// The selected segment index value.
    case selectedSegmentIndex(Int)
    /// The selected segment tint color value.
    case selectedSegmentTintColor(UIColor)
    /// The value for setting the divider image of a segmented control.
    case setDividerImage(SegmentedControlSetDividerImageValue)
    /// The value for adjusting the content position of a segmented control.
    case setContentPositionAdjustment(SegmentedControlSetContentPositionAdjustmentValue)
    /// The value for inserting a segment into a segmented control.
    case insertSegmentAction(SegmentedControlInsertSegmentActionValue)
    /// The value for inserting a segment title into a segmented control.
    case insertSegmentTitle(SegmentedControlInsertSegmentTitleValue)
    /// The value for inserting a segment image into a segmented control.
    case insertSegmentImage(SegmentedControlInsertSegmentImageValue)
    /// The value for setting the background image of a segmented control.
    case setBackgroundImage(SegmentedControlSetBackgroundImageValue)
    /// The control attribute.
    case control(ControlAttribute)
    /// The view attribute.
    case view(ViewAttribute)
    
    /// The attribute type.
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
        case .insertSegmentAction(let segmentedControlInsertSegmentActionValue):
            return SegmentedControlInsertSegmentAction(value: segmentedControlInsertSegmentActionValue)
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
    
    /// Modifies the specified view by applying the attribute to a UISegmentedControl.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct representing an attribute for configuring the momentary behavior of a segmented control.
public struct SegmentedControlIsMomentary: Attribute {
    /// The value indicating whether the segmented control is momentary.
    public let value: Bool
    
    /// Initializes a new instance of `SegmentedControlIsMomentary`.
    /// - Parameter value: The value indicating whether the segmented control is momentary.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the momentary behavior of the segmented control.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.isMomentary = value
    }
}

/// A struct that represents an attribute for a segmented control that determines whether the segment widths should be apportioned by content.
public struct SegmentedControlApportionsSegmentWidthsByContent: Attribute {
    /// The value that determines whether the segment widths should be apportioned by content.
    public let value: Bool
    
    /// Initializes a new instance of the `SegmentedControlApportionsSegmentWidthsByContent` struct.
    /// - Parameter value: A boolean value indicating whether the segment widths should be apportioned by content.
    public init(value: Bool) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the `apportionsSegmentWidthsByContent` property of the segmented control.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.apportionsSegmentWidthsByContent = value
    }
}
/// A struct representing an attribute for setting the selected segment index of a UISegmentedControl.
public struct SegmentedControlSelectedSegmentIndex: Attribute {
    public let value: Int
    
    /// Initializes a new instance of `SegmentedControlSelectedSegmentIndex` with the specified value.
    /// - Parameter value: The selected segment index value.
    public init(value: Int) {
        self.value = value
    }
    
    /// Modifies the specified view by setting its selected segment index to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.selectedSegmentIndex = value
    }
}
@available(iOS 13.0, *)
/// A struct that represents an attribute for the selected segment tint color of a segmented control.
public struct SegmentedControlSelectedSegmentTintColor: Attribute {
    /// The value of the selected segment tint color.
    public let value: UIColor
    
    /// Initializes a new instance of `SegmentedControlSelectedSegmentTintColor`.
    /// - Parameter value: The value of the selected segment tint color.
    public init(value: UIColor) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the selected segment tint color of a segmented control.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.selectedSegmentTintColor = value
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for inserting a segment into a UISegmentedControl.
public struct SegmentedControlInsertSegmentAction: Attribute {
    /// The value of the insert segment action.
    public var value: SegmentedControlInsertSegmentActionValue
    
    /// Initializes a new instance of the SegmentedControlInsertSegmentAction struct.
    /// - Parameter value: The value of the insert segment action.
    public init(value: SegmentedControlInsertSegmentActionValue) {
        self.value = value
    }
    
    /// Modifies the specified view by inserting a segment into a UISegmentedControl.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.insertSegment(action: value.action, at: value.segment, animated: value.animated)
    }
}

@available(iOS 13.0, *)
/// Represents the value for inserting a segment in a segmented control.
public struct SegmentedControlInsertSegmentActionValue {
    /// The action associated with the segment.
    public let action: UIAction
    /// The index of the segment.
    public let segment: Int
    /// A flag indicating whether the insertion should be animated.
    public let animated: Bool

    /// Initializes a new instance of `SegmentedControlInsertSegmentActionValue`.
    /// - Parameters:
    ///   - action: The action associated with the segment.
    ///   - segment: The index of the segment.
    ///   - animated: A flag indicating whether the insertion should be animated.
    public init(action: UIAction, segment: Int, animated: Bool) {
        self.action = action
        self.segment = segment
        self.animated = animated
    }
}

/// A struct that represents an attribute for inserting a segment title into a UISegmentedControl.
public struct SegmentedControlInsertSegmentTitle: Attribute {
    /// The value of the attribute.
    public var value: SegmentedControlInsertSegmentTitleValue
    
    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: SegmentedControlInsertSegmentTitleValue) {
        self.value = value
    }
    
    /// Modifies the given view by inserting a segment with the specified title at the specified index.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.insertSegment(withTitle: value.title, at: value.segment, animated: value.animated)
    }
}

/// A value type that represents the title, segment index, and animation flag for inserting a segment in a segmented control.
public struct SegmentedControlInsertSegmentTitleValue {
    /// The title of the segment.
    public let title: String
    /// The index of the segment.
    public let segment: Int
    /// A flag indicating whether the insertion should be animated.
    public let animated: Bool
    
    /// Initializes a new instance of `SegmentedControlInsertSegmentTitleValue`.
    /// - Parameters:
    ///   - title: The title of the segment.
    ///   - segment: The index of the segment.
    ///   - animated: A flag indicating whether the insertion should be animated.
    public init(title: String, segment: Int, animated: Bool) {
        self.title = title
        self.segment = segment
        self.animated = animated
    }
}

/// A struct that represents an attribute for inserting an image into a UISegmentedControl.
public struct SegmentedControlInsertSegmentImage: Attribute {
    /// The value of the attribute.
    public var value: SegmentedControlInsertSegmentImageValue
    
    /// Initializes a new instance of the attribute with the given value.
    /// - Parameter value: The value of the attribute.
    public init(value: SegmentedControlInsertSegmentImageValue) {
        self.value = value
    }
    
    /// Modifies the given view by inserting an image into a UISegmentedControl.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.insertSegment(with: value.image, at: value.segment, animated: value.animated)
    }
}

/// Represents a value used to insert an image into a segmented control.
public struct SegmentedControlInsertSegmentImageValue {
    /// The image to be inserted.
    public let image: UIImage
    /// The index of the segment where the image will be inserted.
    public let segment: Int
    /// A flag indicating whether the insertion should be animated.
    public let animated: Bool
    
    /// Initializes a new instance of `SegmentedControlInsertSegmentImageValue`.
    /// - Parameters:
    ///   - image: The image to be inserted.
    ///   - segment: The index of the segment where the image will be inserted.
    ///   - animated: A flag indicating whether the insertion should be animated.
    public init(image: UIImage, segment: Int, animated: Bool) {
        self.image = image
        self.segment = segment
        self.animated = animated
    }
}

/// A struct that represents an attribute for setting the background image of a UISegmentedControl.
public struct SegmentedControlSetBackgroundImage: Attribute {
    /// The value of the attribute.
    public var value: SegmentedControlSetBackgroundImageValue
    
    /// Initializes a new instance of the `SegmentedControlSetBackgroundImage` struct.
    /// - Parameter value: The value of the attribute.
    public init(value: SegmentedControlSetBackgroundImageValue) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the background image of a UISegmentedControl.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.setBackgroundImage(value.backgroundImage, for: value.state, barMetrics: value.barMetrics)
    }
}

/// Represents a value for setting the background image of a segmented control.
public struct SegmentedControlSetBackgroundImageValue {
    /// The background image to be set.
    public let backgroundImage: UIImage
    /// The state for which the background image should be set.
    public let state: UIControl.State
    /// The bar metrics for which the background image should be set.
    public let barMetrics: UIBarMetrics
    
    /// Initializes a new instance of `SegmentedControlSetBackgroundImageValue`.
    /// - Parameters:
    ///   - backgroundImage: The background image to be set.
    ///   - state: The state for which the background image should be set.
    ///   - barMetrics: The bar metrics for which the background image should be set.
    public init(backgroundImage: UIImage, state: UIControl.State, barMetrics: UIBarMetrics) {
        self.backgroundImage = backgroundImage
        self.state = state
        self.barMetrics = barMetrics
    }
}

/// A struct that represents an attribute for setting the divider image of a UISegmentedControl.
public struct SegmentedControlSetDividerImage: Attribute {
    public var value: SegmentedControlSetDividerImageValue
    
    /// Initializes a new instance of `SegmentedControlSetDividerImage`.
    /// - Parameter value: The value for the divider image attribute.
    public init(value: SegmentedControlSetDividerImageValue) {
        self.value = value
    }
    
    /// Modifies the specified view by setting the divider image of a UISegmentedControl.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.setDividerImage(
            value.dividerImage,
            forLeftSegmentState: value.leftState,
            rightSegmentState: value.rightState,
            barMetrics: value.barMetrics
        )
    }
}

/// A value type that represents the configuration for setting a divider image in a segmented control.
public struct SegmentedControlSetDividerImageValue {
    /// The image to be used as the divider.
    public let dividerImage: UIImage
    /// The control state for the left segment.
    public let leftState: UIControl.State
    /// The control state for the right segment.
    public let rightState: UIControl.State
    /// The bar metrics for which the divider image should be used.
    public let barMetrics: UIBarMetrics
    
    /// Initializes a new instance of `SegmentedControlSetDividerImageValue`.
    /// - Parameters:
    ///   - dividerImage: The image to be used as the divider.
    ///   - leftState: The control state for the left segment.
    ///   - rightState: The control state for the right segment.
    ///   - barMetrics: The bar metrics for which the divider image should be used.
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

/// A struct that represents an attribute for adjusting the content position of a segmented control.
public struct SegmentedControlSetContentPositionAdjustment: Attribute {
    public var value: SegmentedControlSetContentPositionAdjustmentValue
    
    /// Initializes a new instance of `SegmentedControlSetContentPositionAdjustment`.
    /// - Parameter value: The value for adjusting the content position.
    public init(value: SegmentedControlSetContentPositionAdjustmentValue) {
        self.value = value
    }
    
    /// Modifies the segmented control by setting the content position adjustment.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let segmentedControl = view as? UISegmentedControl else { return }
        segmentedControl.setContentPositionAdjustment(
            value.adjustment,
            forSegmentType: value.leftCenterRightOrAlone,
            barMetrics: value.barMetrics
        )
    }
}

/// A value that represents the content position adjustment for a segmented control.
public struct SegmentedControlSetContentPositionAdjustmentValue {
    /// The adjustment offset for the content position.
    public let adjustment: UIOffset
    /// The segment of the segmented control to apply the adjustment to.
    public let leftCenterRightOrAlone: UISegmentedControl.Segment
    /// The bar metrics for which the adjustment should be applied.
    public let barMetrics: UIBarMetrics
    
    /// Initializes a new instance of `SegmentedControlSetContentPositionAdjustmentValue`.
    /// - Parameters:
    ///   - adjustment: The adjustment offset for the content position.
    ///   - leftCenterRightOrAlone: The segment of the segmented control to apply the adjustment to.
    ///   - barMetrics: The bar metrics for which the adjustment should be applied.
    public init(adjustment: UIOffset, leftCenterRightOrAlone: UISegmentedControl.Segment, barMetrics: UIBarMetrics) {
        self.adjustment = adjustment
        self.leftCenterRightOrAlone = leftCenterRightOrAlone
        self.barMetrics = barMetrics
    }
}
#endif
