//
//  CalendarViewAttribute.swift
//  
//
//  Created by Tiago Ferreira on 10/05/2023.
//

#if os(iOS)
import UIKit

public enum CalendarViewAttribute: Attribute {
    case delegate(UICalendarViewDelegate)
    case selectionBehavior(UICalendarSelection)
    case locale(Locale)
    case calendar(Calendar)
    case timeZone(TimeZone)
    case fontDesign(UIFontDescriptor.SystemDesign)
    case availableDateRange(DateInterval)
    case visibleDateComponents(DateComponents)
    case wantsDateDecorations(Bool)
    case setVisibleDateComponents(CalendarViewSetVisibleDateComponentsValue)
    case reloadDecorations(CalendarViewReloadDecorationsValue)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

public struct CalendarViewDelegate: Attribute {
    public let value: UICalendarViewDelegate

    public init(value: UICalendarViewDelegate) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.delegate = value
    }

}
public struct CalendarViewSelectionBehavior: Attribute {
    public let value: UICalendarSelection

    public init(value: UICalendarSelection) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.selectionBehavior = value
    }

}
public struct CalendarViewLocale: Attribute {
    public let value: Locale

    public init(value: Locale) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.locale = value
    }

}
public struct CalendarViewCalendar: Attribute {
    public let value: Calendar

    public init(value: Calendar) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.calendar = value
    }

}
public struct CalendarViewTimeZone: Attribute {
    public let value: TimeZone

    public init(value: TimeZone) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.timeZone = value
    }

}
public struct CalendarViewFontDesign: Attribute {
    public let value: UIFontDescriptor.SystemDesign

    public init(value: UIFontDescriptor.SystemDesign) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.fontDesign = value
    }

}
public struct CalendarViewAvailableDateRange: Attribute {
    public let value: DateInterval

    public init(value: DateInterval) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.availableDateRange = value
    }

}
public struct CalendarViewVisibleDateComponents: Attribute {
    public let value: DateComponents

    public init(value: DateComponents) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.visibleDateComponents = value
    }

}
public struct CalendarVieWwantsDateDecorations: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.wantsDateDecorations = value
    }
}

public struct CalendarViewSetVisibleDateComponents: Attribute {
    public var value: CalendarViewSetVisibleDateComponentsValue

    public init(value: CalendarViewSetVisibleDateComponentsValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.setVisibleDateComponents(value.dateComponents, animated: value.animated)
    }
}
public struct CalendarViewReloadDecorations: Attribute {
    public var value: CalendarViewReloadDecorationsValue

    public init(value: CalendarViewReloadDecorationsValue) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let calendarView = view as? UICalendarView else { return }
        calendarView.reloadDecorations(forDateComponents: value.dateComponents, animated: value.animated)
    }
}

// swiftlint:disable:next type_name
public struct CalendarViewSetVisibleDateComponentsValue {
    public let dateComponents: DateComponents
    public let animated: Bool

    public init(dateComponents: DateComponents, animated: Bool) {
        self.dateComponents = dateComponents
        self.animated = animated
    }

}
public struct CalendarViewReloadDecorationsValue {
    public let dateComponents: [DateComponents]
    public let animated: Bool

    public init(dateComponents: [DateComponents], animated: Bool) {
        self.dateComponents = dateComponents
        self.animated = animated
    }

}

#endif
