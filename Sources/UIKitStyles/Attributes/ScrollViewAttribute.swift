#if os(iOS)
import UIKit

/// Enum that represents the attributes for a scroll view.
public enum ScrollViewAttribute: Attribute {
    /// The always bounce horizontal value.
    case alwaysBounceHorizontal(Bool)
    /// The always bounce vertical value.
    case alwaysBounceVertical(Bool)
    /// The automatically adjusts scroll indicator insets value.
    case automaticallyAdjustsScrollIndicatorInsets(Bool)
    /// The bounces value.
    case bounces(Bool)
    /// The bounces zoom value.
    case bouncesZoom(Bool)
    /// The can cancel content touches value.
    case canCancelContentTouches(Bool)
    /// The content inset value.
    case contentInset(UIEdgeInsets)
    /// The content inset adjustment behavior value.
    case contentInsetAdjustmentBehavior(UIScrollView.ContentInsetAdjustmentBehavior)
    /// The content offset value.
    case contentOffset(CGPoint)
    /// The content size value.
    case contentSize(CGSize)
    /// The deceleration rate value.
    case decelerationRate(UIScrollView.DecelerationRate)
    /// The delays content touches value.
    case delaysContentTouches(Bool)
    /// The horizontal scroll indicator insets value.
    case horizontalScrollIndicatorInsets(UIEdgeInsets)
    /// The index display mode value.
    case indexDisplayMode(UIScrollView.IndexDisplayMode)
    /// The indicator style value.
    case indicatorStyle(UIScrollView.IndicatorStyle)
    /// The is directional lock enabled value.
    case isDirectionalLockEnabled(Bool)
    /// The is paging enabled value.
    case isPagingEnabled(Bool)
    /// The is scroll enabled value.
    case isScrollEnabled(Bool)
    /// The keyboard dismiss mode value.
    case keyboardDismissMode(UIScrollView.KeyboardDismissMode)
    /// The maximum zoom scale value.
    case maximumZoomScale(CGFloat)
    /// The minimum zoom scale value.
    case minimumZoomScale(CGFloat)
    /// The refresh control value.
    case refreshControl(UIRefreshControl)
    /// The scroll indicator insets value.
    case scrollIndicatorInsets(UIEdgeInsets)
    /// The scrolls to top value.
    case scrollsToTop(Bool)
    /// The shows horizontal scroll indicator value.
    case showsHorizontalScrollIndicator(Bool)
    /// The shows vertical scroll indicator value.
    case showsVerticalScrollIndicator(Bool)
    /// The zoom scale value.
    case verticalScrollIndicatorInsets(UIEdgeInsets)
    /// The zoom scale value.
    case zoomScale(CGFloat)
    /// The view attribute.
    case view(ViewAttribute)

    /// The attribute type.
    public var value: any Attribute {
        switch self {
        case .alwaysBounceHorizontal(let value):
            return ScrollViewAlwaysBounceHorizontal(value: value)
        case .alwaysBounceVertical(let value):
            return ScrollViewAlwaysBounceVertical(value: value)
        case .bounces(let value):
            return ScrollViewBounces(value: value)
        case .bouncesZoom(let value):
            return ScrollViewBouncesZoom(value: value)
        case .canCancelContentTouches(let value):
            return ScrollViewCanCancelContentTouches(value: value)
        case .contentInset(let value):
            return ScrollViewContentInset(value: value)
        case .contentInsetAdjustmentBehavior(let value):
            return ScrollViewContentInsetAdjustmentBehavior(value: value)
        case .contentOffset(let value):
            return ScrollViewContentOffset(value: value)
        case .contentSize(let value):
            return ScrollViewContentSize(value: value)
        case .decelerationRate(let value):
            return ScrollViewDecelerationRate(value: value)
        case .delaysContentTouches(let value):
            return ScrollViewDelaysContentTouches(value: value)
        case .indexDisplayMode(let value):
            return ScrollViewIndexDisplayMode(value: value)
        case .indicatorStyle(let value):
            return ScrollViewIndicatorStyle(value: value)
        case .isDirectionalLockEnabled(let value):
            return ScrollViewIsDirectionalLockEnabled(value: value)
        case .isPagingEnabled(let value):
            return ScrollViewIsPagingEnabled(value: value)
        case .isScrollEnabled(let value):
            return ScrollViewIsScrollEnabled(value: value)
        case .keyboardDismissMode(let value):
            return ScrollViewKeyboardDismissMode(value: value)
        case .maximumZoomScale(let value):
            return ScrollViewMaximumZoomScale(value: value)
        case .minimumZoomScale(let value):
            return ScrollViewMinimumZoomScale(value: value)
        case .refreshControl(let value):
            return ScrollViewRefreshControl(value: value)
        case .scrollIndicatorInsets(let value):
            return ScrollViewScrollIndicatorInsets(value: value)
        case .scrollsToTop(let value):
            return ScrollViewScrollsToTop(value: value)
        case .showsHorizontalScrollIndicator(let value):
            return ScrollViewShowsHorizontalScrollIndicator(value: value)
        case .showsVerticalScrollIndicator(let value):
            return ScrollViewShowsVerticalScrollIndicator(value: value)
        case .zoomScale(let value):
            return ScrollViewZoomScale(value: value)
        case .horizontalScrollIndicatorInsets(let value):
            if #available(iOS 11.1, *) {
                return ScrollViewHorizontalScrollIndicatorInsets(value: value)
            } else {
                return EmptyAttribute()
            }
        case .automaticallyAdjustsScrollIndicatorInsets(let value):
            if #available(iOS 13.0, *) {
                return ScrollViewAutomaticallyAdjustsScrollIndicatorInsets(value: value)
            } else {
                return EmptyAttribute()
            }
        case .view(let value):
            return value.value
        case .verticalScrollIndicatorInsets(let value):
            if #available(iOS 11.1, *) {
                return ScrollViewVerticalScrollIndicatorInsets(value: value)
            } else {
                return EmptyAttribute()
            }
        }
    }

    /// Modifies the specified view by applying the attribute to a UILabel.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct that represents the zoom scale attribute for a scroll view.
public struct ScrollViewZoomScale: Attribute {
    /// The value of the zoom scale.
    public var value: CGFloat

    /// Initializes a new instance of the `ScrollViewZoomScale` struct.
    /// - Parameter value: The value of the zoom scale.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting its zoom scale to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.zoomScale = value
    }
}

@available(iOS 11.1, *)
/// A struct that represents the attribute for setting the vertical scroll indicator insets of a scroll view.
public struct ScrollViewVerticalScrollIndicatorInsets: Attribute {
    /// The value of the vertical scroll indicator insets.
    public var value: UIEdgeInsets

    /// Initializes a new instance of the `ScrollViewVerticalScrollIndicatorInsets` struct.
    /// - Parameter value: The value of the vertical scroll indicator insets.
    public init(value: UIEdgeInsets) {
        self.value = value
    }

    /// Modifies the specified view by setting the vertical scroll indicator insets of the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.verticalScrollIndicatorInsets = value
    }
}

/// A struct representing an attribute that controls the visibility of the vertical scroll indicator in a scroll view.
public struct ScrollViewShowsVerticalScrollIndicator: Attribute {
    /// The value indicating whether the vertical scroll indicator should be shown or hidden.
    public var value: Bool

    /// Initializes a new instance of `ScrollViewShowsVerticalScrollIndicator`.
    /// - Parameter value: The value indicating whether the vertical scroll indicator should be shown or hidden.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `showsVerticalScrollIndicator` property of the underlying `UIScrollView`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.showsVerticalScrollIndicator = value
    }
}

/// A struct representing an attribute for showing or hiding the horizontal scroll indicator in a scroll view.
public struct ScrollViewShowsHorizontalScrollIndicator: Attribute {
    /// The value indicating whether the horizontal scroll indicator should be shown or hidden.
    public var value: Bool

    /// Initializes a new instance of the `ScrollViewShowsHorizontalScrollIndicator` struct.
    /// - Parameter value: A boolean value indicating whether the horizontal scroll indicator should be shown or hidden.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `showsHorizontalScrollIndicator` property of the underlying scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.showsHorizontalScrollIndicator = value
    }
}

/// A struct that represents the attribute for enabling or disabling the "scrollsToTop" behavior of a UIScrollView.
public struct ScrollViewScrollsToTop: Attribute {
    public var value: Bool

    /// Initializes a new instance of ScrollViewScrollsToTop.
    /// - Parameter value: A boolean value indicating whether the "scrollsToTop" behavior should be enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its "scrollsToTop" property to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.scrollsToTop = value
    }
}

/// A struct that represents the attribute for modifying the scroll indicator insets of a UIScrollView.
public struct ScrollViewScrollIndicatorInsets: Attribute {
    public var value: UIEdgeInsets

    /// Initializes a new instance of ScrollViewScrollIndicatorInsets.
    /// - Parameter value: The UIEdgeInsets value for the scroll indicator insets.
    public init(value: UIEdgeInsets) {
        self.value = value
    }

    /// Modifies the scroll indicator insets of a UIView, if it is a UIScrollView.
    /// - Parameter view: The UIView to modify.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.scrollIndicatorInsets = value
    }
}

/// A struct that represents an attribute for a scroll view's refresh control.
public struct ScrollViewRefreshControl: Attribute {
    /// The refresh control value.
    public var value: UIRefreshControl

    /// Initializes a new instance of the `ScrollViewRefreshControl` struct.
    /// - Parameter value: The refresh control value.
    public init(value: UIRefreshControl) {
        self.value = value
    }

    /// Modifies the specified view by setting the refresh control.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.refreshControl = value
    }
}

/// A struct that represents the minimum zoom scale attribute for a scroll view.
public struct ScrollViewMinimumZoomScale: Attribute {
    /// The value of the minimum zoom scale.
    public var value: CGFloat

    /// Initializes a new instance of the `ScrollViewMinimumZoomScale` struct.
    /// - Parameter value: The value of the minimum zoom scale.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting its minimum zoom scale to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.minimumZoomScale = value
    }
}

/// A struct representing the maximum zoom scale attribute for a scroll view.
public struct ScrollViewMaximumZoomScale: Attribute {
    /// The value of the maximum zoom scale.
    public var value: CGFloat

    /// Initializes a new instance of the `ScrollViewMaximumZoomScale` struct.
    /// - Parameter value: The value of the maximum zoom scale.
    public init(value: CGFloat) {
        self.value = value
    }

    /// Modifies the specified view by setting its maximum zoom scale to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.maximumZoomScale = value
    }
}

/// A struct that represents an attribute for configuring the keyboard dismiss mode of a UIScrollView.
public struct ScrollViewKeyboardDismissMode: Attribute {
    /// The value of the keyboard dismiss mode.
    public var value: UIScrollView.KeyboardDismissMode

    /// Initializes a new instance of ScrollViewKeyboardDismissMode with the specified value.
    /// - Parameter value: The value of the keyboard dismiss mode.
    public init(value: UIScrollView.KeyboardDismissMode) {
        self.value = value
    }

    /// Modifies the specified view by setting its keyboard dismiss mode to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.keyboardDismissMode = value
    }
}

/// A struct that represents an attribute for enabling or disabling scrolling in a scroll view.
public struct ScrollViewIsScrollEnabled: Attribute {
    /// The value indicating whether scrolling is enabled or disabled.
    public var value: Bool

    /// Initializes a new instance of `ScrollViewIsScrollEnabled` with the specified value.
    /// - Parameter value: The value indicating whether scrolling is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling scrolling based on the attribute's value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.isScrollEnabled = value
    }
}

/// A struct representing an attribute for enabling or disabling paging in a scroll view.
public struct ScrollViewIsPagingEnabled: Attribute {
    /// The value indicating whether paging is enabled or disabled.
    public var value: Bool

    /// Initializes a new instance of `ScrollViewIsPagingEnabled`.
    /// - Parameter value: The value indicating whether paging is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling paging in the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.isPagingEnabled = value
    }
}

public struct ScrollViewIsDirectionalLockEnabled: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.isDirectionalLockEnabled = value
    }
}

/// A struct that represents the attribute for customizing the indicator style of a scroll view.
public struct ScrollViewIndicatorStyle: Attribute {
    /// The value of the indicator style.
    public var value: UIScrollView.IndicatorStyle

    /// Initializes a new instance of the `ScrollViewIndicatorStyle` struct.
    /// - Parameter value: The value of the indicator style.
    public init(value: UIScrollView.IndicatorStyle) {
        self.value = value
    }

    /// Modifies the specified view by setting its indicator style to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.indicatorStyle = value
    }
}

/// A struct that represents an attribute for configuring the index display mode of a UIScrollView.
public struct ScrollViewIndexDisplayMode: Attribute {
    /// The value of the index display mode.
    public var value: UIScrollView.IndexDisplayMode

    /// Initializes a new instance of ScrollViewIndexDisplayMode with the specified value.
    /// - Parameter value: The value of the index display mode.
    public init(value: UIScrollView.IndexDisplayMode) {
        self.value = value
    }

    /// Modifies the specified view by setting its index display mode to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.indexDisplayMode = value
    }
}

@available(iOS 11.1, *)
/// A struct that represents the attribute for setting the horizontal scroll indicator insets of a scroll view.
public struct ScrollViewHorizontalScrollIndicatorInsets: Attribute {
    public var value: UIEdgeInsets

    /// Initializes a new instance of `ScrollViewHorizontalScrollIndicatorInsets`.
    /// - Parameter value: The insets value for the horizontal scroll indicator.
    public init(value: UIEdgeInsets) {
        self.value = value
    }

    /// Modifies the specified view by setting the horizontal scroll indicator insets to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.horizontalScrollIndicatorInsets = value
    }
}

/// A struct representing an attribute that controls whether a scroll view delays the handling of touch events.
public struct ScrollViewDelaysContentTouches: Attribute {
    /// The value indicating whether the scroll view delays the handling of touch events.
    public var value: Bool

    /// Initializes a new instance of the `ScrollViewDelaysContentTouches` struct.
    /// - Parameter value: The value indicating whether the scroll view delays the handling of touch events.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `delaysContentTouches` property of the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.delaysContentTouches = value
    }
}

/// A struct that represents an attribute for modifying the deceleration rate of a UIScrollView.
public struct ScrollViewDecelerationRate: Attribute {
    public var value: UIScrollView.DecelerationRate

    /// Initializes a new instance of ScrollViewDecelerationRate.
    /// - Parameter value: The deceleration rate value.
    public init(value: UIScrollView.DecelerationRate) {
        self.value = value
    }

    /// Modifies the specified view by setting its deceleration rate to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.decelerationRate = value
    }
}

/// A struct that represents the content size attribute for a scroll view.
public struct ScrollViewContentSize: Attribute {
    public var value: CGSize

    /// Initializes a new instance of `ScrollViewContentSize` with the specified value.
    /// - Parameter value: The content size value.
    public init(value: CGSize) {
        self.value = value
    }

    /// Modifies the specified view by setting its content size to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentSize = value
    }
}

/// A struct that represents the content offset attribute for a scroll view.
public struct ScrollViewContentOffset: Attribute {
    /// The value of the content offset.
    public var value: CGPoint

    /// Initializes a new instance of `ScrollViewContentOffset` with the given value.
    /// - Parameter value: The value of the content offset.
    public init(value: CGPoint) {
        self.value = value
    }

    /// Modifies the specified view by setting its content offset to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentOffset = value
    }
}

/// A struct that represents an attribute for adjusting the content inset behavior of a scroll view.
public struct ScrollViewContentInsetAdjustmentBehavior: Attribute {
    /// The value of the content inset adjustment behavior.
    public var value: UIScrollView.ContentInsetAdjustmentBehavior

    /// Initializes a new instance of `ScrollViewContentInsetAdjustmentBehavior`.
    /// - Parameter value: The value of the content inset adjustment behavior.
    public init(value: UIScrollView.ContentInsetAdjustmentBehavior) {
        self.value = value
    }

    /// Modifies the specified view by setting its content inset adjustment behavior.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentInsetAdjustmentBehavior = value
    }
}

/// A struct that represents the content inset attribute for a scroll view.
public struct ScrollViewContentInset: Attribute {
    /// The value of the content inset.
    public var value: UIEdgeInsets

    /// Initializes a new instance of `ScrollViewContentInset` with the specified value.
    /// - Parameter value: The value of the content inset.
    public init(value: UIEdgeInsets) {
        self.value = value
    }

    /// Modifies the specified view by setting its content inset to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentInset = value
    }
}

/// A struct representing an attribute that determines whether a scroll view can cancel touches on its content.
public struct ScrollViewCanCancelContentTouches: Attribute {
    /// The value indicating whether the scroll view can cancel touches on its content.
    public var value: Bool

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value indicating whether the scroll view can cancel touches on its content.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `canCancelContentTouches` property of the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.canCancelContentTouches = value
    }
}

/// A struct that represents an attribute for enabling or disabling horizontal bounce in a scroll view.
public struct ScrollViewAlwaysBounceHorizontal: Attribute {
    /// The value indicating whether the horizontal bounce is enabled or disabled.
    public var value: Bool

    /// Initializes a new instance of `ScrollViewAlwaysBounceHorizontal`.
    /// - Parameter value: The value indicating whether the horizontal bounce is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the provided view by enabling or disabling horizontal bounce in the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.alwaysBounceHorizontal = value
    }
}

/// A struct representing the attribute to control whether a scroll view bounces during zooming.
public struct ScrollViewBouncesZoom: Attribute {
    /// The value indicating whether the scroll view bounces during zooming.
    public var value: Bool

    /// Initializes a new instance of the `ScrollViewBouncesZoom` struct.
    /// - Parameter value: The value indicating whether the scroll view bounces during zooming.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `bouncesZoom` property of the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.bouncesZoom = value
    }
}

/// A struct representing the attribute for enabling or disabling bouncing behavior in a scroll view.
public struct ScrollViewBounces: Attribute {
    /// The value indicating whether bouncing behavior is enabled or disabled.
    public var value: Bool

    /// Initializes a new instance of the `ScrollViewBounces` struct.
    /// - Parameter value: The value indicating whether bouncing behavior is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling bouncing behavior in a scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.bounces = value
    }
}

@available(iOS 13.0, *)
/// A struct representing an attribute for automatically adjusting scroll indicator insets of a scroll view.
public struct ScrollViewAutomaticallyAdjustsScrollIndicatorInsets: Attribute {
    /// The value indicating whether the scroll view should automatically adjust scroll indicator insets.
    public var value: Bool

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value indicating whether the scroll view should automatically adjust scroll indicator insets.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `automaticallyAdjustsScrollIndicatorInsets` property of the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.automaticallyAdjustsScrollIndicatorInsets = value
    }
}

/// A struct that represents an attribute for enabling or disabling vertical bounce in a scroll view.
public struct ScrollViewAlwaysBounceVertical: Attribute {
    /// The value indicating whether vertical bounce is enabled or disabled.
    public var value: Bool

    /// Initializes a new instance of `ScrollViewAlwaysBounceVertical`.
    /// - Parameter value: The value indicating whether vertical bounce is enabled or disabled.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by enabling or disabling vertical bounce in the scroll view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.alwaysBounceVertical = value
    }
}
#endif
