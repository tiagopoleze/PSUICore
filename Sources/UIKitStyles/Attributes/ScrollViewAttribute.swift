#if os(iOS)
import UIKit

public enum ScrollViewAttribute: Attribute {
    case alwaysBounceHorizontal(Bool)
    case alwaysBounceVertical(Bool)
    // swiftlint:disable:next identifier_name
    case automaticallyAdjustsScrollIndicatorInsets(Bool)
    case bounces(Bool)
    case bouncesZoom(Bool)
    case canCancelContentTouches(Bool)
    case contentInset(UIEdgeInsets)
    case contentInsetAdjustmentBehavior(UIScrollView.ContentInsetAdjustmentBehavior)
    case contentOffset(CGPoint)
    case contentSize(CGSize)
    case decelerationRate(UIScrollView.DecelerationRate)
    case delaysContentTouches(Bool)
    case horizontalScrollIndicatorInsets(UIEdgeInsets)
    case indexDisplayMode(UIScrollView.IndexDisplayMode)
    case indicatorStyle(UIScrollView.IndicatorStyle)
    case isDirectionalLockEnabled(Bool)
    case isPagingEnabled(Bool)
    case isScrollEnabled(Bool)
    case keyboardDismissMode(UIScrollView.KeyboardDismissMode)
    case maximumZoomScale(CGFloat)
    case minimumZoomScale(CGFloat)
    case refreshControl(UIRefreshControl)
    case scrollIndicatorInsets(UIEdgeInsets)
    case scrollsToTop(Bool)
    case showsHorizontalScrollIndicator(Bool)
    case showsVerticalScrollIndicator(Bool)
    case verticalScrollIndicatorInsets(UIEdgeInsets)
    case zoomScale(CGFloat)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct ScrollViewZoomScale: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.zoomScale = value
    }
}

@available(iOS 11.1, *)
public struct ScrollViewVerticalScrollIndicatorInsets: Attribute {
    public var value: UIEdgeInsets

    public init(value: UIEdgeInsets) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.verticalScrollIndicatorInsets = value
    }
}

public struct ScrollViewShowsVerticalScrollIndicator: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.showsVerticalScrollIndicator = value
    }
}

public struct ScrollViewShowsHorizontalScrollIndicator: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.showsHorizontalScrollIndicator = value
    }
}

public struct ScrollViewScrollsToTop: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.scrollsToTop = value
    }
}

public struct ScrollViewScrollIndicatorInsets: Attribute {
    public var value: UIEdgeInsets

    public init(value: UIEdgeInsets) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.scrollIndicatorInsets = value
    }
}

public struct ScrollViewRefreshControl: Attribute {
    public var value: UIRefreshControl

    public init(value: UIRefreshControl) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.refreshControl = value
    }
}

public struct ScrollViewMinimumZoomScale: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.minimumZoomScale = value
    }
}

public struct ScrollViewMaximumZoomScale: Attribute {
    public var value: CGFloat

    public init(value: CGFloat) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.maximumZoomScale = value
    }
}

public struct ScrollViewKeyboardDismissMode: Attribute {
    public var value: UIScrollView.KeyboardDismissMode

    public init(value: UIScrollView.KeyboardDismissMode) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.keyboardDismissMode = value
    }
}

public struct ScrollViewIsScrollEnabled: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.isScrollEnabled = value
    }
}

public struct ScrollViewIsPagingEnabled: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

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

public struct ScrollViewIndicatorStyle: Attribute {
    public var value: UIScrollView.IndicatorStyle

    public init(value: UIScrollView.IndicatorStyle) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.indicatorStyle = value
    }
}

public struct ScrollViewIndexDisplayMode: Attribute {
    public var value: UIScrollView.IndexDisplayMode

    public init(value: UIScrollView.IndexDisplayMode) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.indexDisplayMode = value
    }
}

@available(iOS 11.1, *)
// swiftlint:disable:next type_name
public struct ScrollViewHorizontalScrollIndicatorInsets: Attribute {
    public var value: UIEdgeInsets

    public init(value: UIEdgeInsets) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.horizontalScrollIndicatorInsets = value
    }
}

public struct ScrollViewDelaysContentTouches: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.delaysContentTouches = value
    }
}

public struct ScrollViewDecelerationRate: Attribute {
    public var value: UIScrollView.DecelerationRate

    public init(value: UIScrollView.DecelerationRate) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.decelerationRate = value
    }
}

public struct ScrollViewContentSize: Attribute {
    public var value: CGSize

    public init(value: CGSize) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentSize = value
    }
}

public struct ScrollViewContentOffset: Attribute {
    public var value: CGPoint

    public init(value: CGPoint) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentOffset = value
    }
}

public struct ScrollViewContentInsetAdjustmentBehavior: Attribute {
    public var value: UIScrollView.ContentInsetAdjustmentBehavior

    public init(value: UIScrollView.ContentInsetAdjustmentBehavior) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentInsetAdjustmentBehavior = value
    }
}

public struct ScrollViewContentInset: Attribute {
    public var value: UIEdgeInsets

    public init(value: UIEdgeInsets) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.contentInset = value
    }
}

public struct ScrollViewCanCancelContentTouches: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.canCancelContentTouches = value
    }
}

public struct ScrollViewAlwaysBounceHorizontal: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.alwaysBounceHorizontal = value
    }
}

public struct ScrollViewBouncesZoom: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.bouncesZoom = value
    }
}

public struct ScrollViewBounces: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.bounces = value
    }
}

@available(iOS 13.0, *)
// swiftlint:disable:next type_name
public struct ScrollViewAutomaticallyAdjustsScrollIndicatorInsets: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.automaticallyAdjustsScrollIndicatorInsets = value
    }
}

public struct ScrollViewAlwaysBounceVertical: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let scrollView = view as? UIScrollView else { return }
        scrollView.alwaysBounceVertical = value
    }
}
#endif
