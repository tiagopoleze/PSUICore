#if os(iOS)
import UIKit

@available(iOS 16.0, *)
/// Enum that represents attributes for a `UICalendarView`.
public enum CalendarViewAttribute: Attribute {
    /// The delegate for the `UICalendarView`.
    case delegate(UICalendarViewDelegate)
    /// The selection behavior for the `UICalendarView`.
    case selectionBehavior(UICalendarSelection)
    /// The locale for the `UICalendarView`.
    case locale(Locale)
    /// The calendar for the `UICalendarView`.
    case calendar(Calendar)
    /// The time zone for the `UICalendarView`.
    case timeZone(TimeZone)
    /// The font design for the `UICalendarView`.
    case fontDesign(UIFontDescriptor.SystemDesign)
    /// The available date range for the `UICalendarView`.
    case availableDateRange(DateInterval)
    /// The visible date components for the `UICalendarView`.
    case visibleDateComponents(DateComponents)
    /// A flag indicating whether the `UICalendarView` should display date decorations.
    case wantsDateDecorations(Bool)
    /// The visible date components for the `UICalendarView`.
    case setVisibleDateComponents(CalendarViewSetVisibleDateComponentsValue)
    /// The date components associated with the decorations to be reloaded.
    case reloadDecorations(CalendarViewReloadDecorationsValue)
    /// A view attribute.
    case view(ViewAttribute)

    /// The value associated with the attribute.
    public var value: any Attribute {
        switch self {
        case .delegate(let uICalendarViewDelegate):
            return CalendarViewDelegate(value: uICalendarViewDelegate)
        case .selectionBehavior(let uICalendarSelection):
            return CalendarViewSelectionBehavior(value: uICalendarSelection)
        case .locale(let locale):
            return CalendarViewLocale(value: locale)
        case .calendar(let calendar):
            return CalendarViewCalendar(value: calendar)
        case .timeZone(let timeZone):
            return CalendarViewTimeZone(value: timeZone)
        case .fontDesign(let systemDesign):
            return CalendarViewFontDesign(value: systemDesign)
        case .availableDateRange(let dateInterval):
            return CalendarViewAvailableDateRange(value: dateInterval)
        case .visibleDateComponents(let dateComponents):
            return CalendarViewVisibleDateComponents(value: dateComponents)
        case .wantsDateDecorations(let bool):
            return CalendarVieWwantsDateDecorations(value: bool)
        case .setVisibleDateComponents(let value):
            return CalendarViewSetVisibleDateComponents(value: value)
        case .reloadDecorations(let calendarViewReloadDecorationsValue):
            return CalendarViewReloadDecorations(value: calendarViewReloadDecorationsValue)
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    /// Modifies the given view using the stored value.
    /// - Parameters:
    ///    - view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

@available(iOS 16.0, *)
/// A struct that represents an attribute for a `UICalendarView` delegate.
public struct CalendarViewDelegate: Attribute {
    /// The delegate value for the `UICalendarView`.
    public let value: UICalendarViewDelegate

    /// Initializes a `CalendarViewDelegate` with the specified delegate value.
    /// - Parameter value: The delegate value for the `UICalendarView`.
    public init(value: UICalendarViewDelegate) {
        self.value = value
    }

    /// Modifies the specified view by setting its delegate to the `value` of the `CalendarViewDelegate`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.delegate = value
    }
}
@available(iOS 16.0, *)
/// A struct that represents the behavior of the selection in a calendar view.
public struct CalendarViewSelectionBehavior: Attribute {
    public let value: UICalendarSelection

    /// Initializes a new instance of `CalendarViewSelectionBehavior`.
    /// - Parameter value: The value representing the selection behavior.
    public init(value: UICalendarSelection) {
        self.value = value
    }

    /// Modifies the specified view with the selection behavior.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.selectionBehavior = value
    }
}
@available(iOS 16.0, *)
/// A struct that represents an attribute for configuring the locale of a `UICalendarView`.
public struct CalendarViewLocale: Attribute {
    /// The locale value to be set for the `UICalendarView`.
    public let value: Locale

    /// Initializes a new instance of `CalendarViewLocale` with the specified locale value.
    /// - Parameter value: The locale value to be set for the `UICalendarView`.
    public init(value: Locale) {
        self.value = value
    }

    /// Modifies the specified view by setting its locale to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.locale = value
    }
}
@available(iOS 16.0, *)
/// A struct representing an attribute for a calendar view.
public struct CalendarViewCalendar: Attribute {
    /// The value of the calendar attribute.
    public let value: Calendar

    /// Initializes a new instance of the `CalendarViewCalendar` struct.
    /// - Parameter value: The value of the calendar attribute.
    public init(value: Calendar) {
        self.value = value
    }

    /// Modifies the specified view with the calendar attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.calendar = value
    }
}
@available(iOS 16.0, *)
/// A struct that represents an attribute for setting the time zone of a calendar view.
public struct CalendarViewTimeZone: Attribute {
    /// The time zone value.
    public let value: TimeZone

    /// Initializes a new instance of `CalendarViewTimeZone`.
    /// - Parameter value: The time zone value.
    public init(value: TimeZone) {
        self.value = value
    }

    /// Modifies the specified view by setting its time zone to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.timeZone = value
    }
}
@available(iOS 16.0, *)
/// A struct that represents the font design attribute for a calendar view.
public struct CalendarViewFontDesign: Attribute {
    /// The value of the font design.
    public let value: UIFontDescriptor.SystemDesign

    /// Initializes a new instance of the `CalendarViewFontDesign` struct.
    /// - Parameter value: The value of the font design.
    public init(value: UIFontDescriptor.SystemDesign) {
        self.value = value
    }

    /// Modifies the specified view by setting the font design of a `UICalendarView`.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.fontDesign = value
    }
}
@available(iOS 16.0, *)
/// A struct that represents the available date range for a calendar view.
public struct CalendarViewAvailableDateRange: Attribute {
    public let value: DateInterval

    /// Initializes a new instance of `CalendarViewAvailableDateRange`.
    /// - Parameter value: The date interval representing the available date range.
    public init(value: DateInterval) {
        self.value = value
    }

    /// Modifies the specified view by setting its available date range to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.availableDateRange = value
    }
}
@available(iOS 16.0, *)
/// A struct representing an attribute for setting the visible date components of a calendar view.
public struct CalendarViewVisibleDateComponents: Attribute {
    /// The value of the visible date components.
    public let value: DateComponents

    /// Initializes a new instance of `CalendarViewVisibleDateComponents`.
    /// - Parameter value: The value of the visible date components.
    public init(value: DateComponents) {
        self.value = value
    }

    /// Modifies the specified view by setting its visible date components to the stored value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.visibleDateComponents = value
    }
}
@available(iOS 16.0, *)
/// A struct that represents an attribute for a calendar view.
public struct CalendarVieWwantsDateDecorations: Attribute {
    /// The value of the attribute.
    public let value: Bool

    /// Initializes a new instance of the `CalendarVieWwantsDateDecorations` struct.
    /// - Parameter value: The value of the attribute.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view with the attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.wantsDateDecorations = value
    }
}

@available(iOS 16.0, *)
/// A struct that represents an attribute for setting the visible date components of a calendar view.
public struct CalendarViewSetVisibleDateComponents: Attribute {
    /// The value of the attribute.
    public var value: CalendarViewSetVisibleDateComponentsValue

    /// Initializes a new instance of the `CalendarViewSetVisibleDateComponents` struct.
    /// - Parameter value: The value of the attribute.
    public init(value: CalendarViewSetVisibleDateComponentsValue) {
        self.value = value
    }

    /// Modifies the specified view by setting its visible date components.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.setVisibleDateComponents(value.dateComponents, animated: value.animated)
    }
}
@available(iOS 16.0, *)
/// A struct that represents an attribute for reloading decorations in a calendar view.
public struct CalendarViewReloadDecorations: Attribute {
    /// The value of the reload decorations attribute.
    public var value: CalendarViewReloadDecorationsValue

    /// Initializes a new instance of the `CalendarViewReloadDecorations` struct.
    /// - Parameter value: The value of the reload decorations attribute.
    public init(value: CalendarViewReloadDecorationsValue) {
        self.value = value
    }

    /// Modifies the specified view by reloading decorations for the specified date components.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.reloadDecorations(forDateComponents: value.dateComponents, animated: value.animated)
    }
}

/// Represents a value used to set the visible date components of a calendar view.
public struct CalendarViewSetVisibleDateComponentsValue {
    /// The date components to set as the visible date.
    public let dateComponents: DateComponents
    /// A flag indicating whether the change should be animated.
    public let animated: Bool

    /// Initializes a new instance of `CalendarViewSetVisibleDateComponentsValue`.
    /// - Parameters:
    ///   - dateComponents: The date components to set as the visible date.
    ///   - animated: A flag indicating whether the change should be animated.
    public init(dateComponents: DateComponents, animated: Bool) {
        self.dateComponents = dateComponents
        self.animated = animated
    }
}
/// A value used to reload decorations in a calendar view.
public struct CalendarViewReloadDecorationsValue {
    /// The date components associated with the decorations to be reloaded.
    public let dateComponents: [DateComponents]
    /// A flag indicating whether the reload should be animated.
    public let animated: Bool

    /// Initializes a new instance of `CalendarViewReloadDecorationsValue`.
    /// - Parameters:
    ///   - dateComponents: The date components associated with the decorations to be reloaded.
    ///   - animated: A flag indicating whether the reload should be animated.
    public init(dateComponents: [DateComponents], animated: Bool) {
        self.dateComponents = dateComponents
        self.animated = animated
    }
}

#endif
