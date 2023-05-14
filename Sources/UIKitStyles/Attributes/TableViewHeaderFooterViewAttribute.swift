#if os(iOS)
import UIKit

public enum TableViewHeaderFooterViewAttribute: Attribute {
    case automaticallyUpdatesContentConfiguration(Bool)
    // swiftlint:disable:next identifier_name
    case automaticallyUpdatesBackgroundConfiguration(Bool)
    case backgroundView(UIView)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case .automaticallyUpdatesContentConfiguration(let bool):
            if #available(iOS 14.0, *) {
                return TableViewHeaderFooterViewAutomaticallyUpdatesContentConfiguration(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .automaticallyUpdatesBackgroundConfiguration(let bool):
            if #available(iOS 14.0, *) {
                return TableViewHeaderFooterViewAutomaticallyUpdatesBackgroundConfiguration(value: bool)
            } else {
                return EmptyAttribute()
            }
        case .backgroundView(let uIView):
            return TableViewHeaderFooterViewBackgroundView(value: uIView)
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

@available(iOS 14.0, *)
// swiftlint:disable:next type_name
public struct TableViewHeaderFooterViewAutomaticallyUpdatesContentConfiguration: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        footer.automaticallyUpdatesContentConfiguration = value
    }
}

@available(iOS 14.0, *)
// swiftlint:disable:next type_name
public struct TableViewHeaderFooterViewAutomaticallyUpdatesBackgroundConfiguration: Attribute {
    public let value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        footer.automaticallyUpdatesBackgroundConfiguration = value
    }
}

public struct TableViewHeaderFooterViewBackgroundView: Attribute {
    public let value: UIView

    public init(value: UIView) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        footer.backgroundView = value
    }
}
#endif
