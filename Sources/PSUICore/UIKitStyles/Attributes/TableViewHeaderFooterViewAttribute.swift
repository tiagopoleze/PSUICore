#if os(iOS)
import UIKit

/// A enum representing the attributes for a `UITableViewHeaderFooterView`.
public enum TableViewHeaderFooterViewAttribute: Attribute {
    /// A boolean value indicating whether the content configuration should be automatically updated.
    case automaticallyUpdatesContentConfiguration(Bool)
    /// A boolean value indicating whether the background configuration should be automatically updated.
    case automaticallyUpdatesBackgroundConfiguration(Bool)
    /// The background view of the table view header or footer view.
    case backgroundView(UIView)
    /// A view attribute that represents the view to be modified.
    case view(ViewAttribute)

    /// The value of the attribute.
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

    /// Modifies the specified view by setting the attribute to the specified value.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for automatically updating the content configuration of a `UITableViewHeaderFooterView`.
public struct TableViewHeaderFooterViewAutomaticallyUpdatesContentConfiguration: Attribute {
    /// The value indicating whether the content configuration should be automatically updated.
    public let value: Bool

    /// Initializes a new instance of `TableViewHeaderFooterViewAutomaticallyUpdatesContentConfiguration`.
    /// - Parameter value: The value indicating whether the content configuration should be automatically updated.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the provided view by setting its `automaticallyUpdatesContentConfiguration` property.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        footer.automaticallyUpdatesContentConfiguration = value
    }
}

@available(iOS 14.0, *)
/// A struct that represents an attribute for automatically updating the background configuration of a table view header or footer view.
public struct TableViewHeaderFooterViewAutomaticallyUpdatesBackgroundConfiguration: Attribute {
    /// The value indicating whether the background configuration should be automatically updated.
    public let value: Bool

    /// Initializes a new instance of the attribute with the specified value.
    /// - Parameter value: The value indicating whether the background configuration should be automatically updated.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting the `automaticallyUpdatesBackgroundConfiguration` property of the table view header or footer view.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        footer.automaticallyUpdatesBackgroundConfiguration = value
    }
}

/// A struct that represents an attribute for customizing the background view of a table view header or footer view.
public struct TableViewHeaderFooterViewBackgroundView: Attribute {
    /// The value of the background view.
    public let value: UIView

    /// Initializes a new instance of the `TableViewHeaderFooterViewBackgroundView` struct.
    /// - Parameter value: The background view to be set.
    public init(value: UIView) {
        self.value = value
    }

    /// Modifies the provided view by setting its background view to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let footer = view as? UITableViewHeaderFooterView else { return }
        footer.backgroundView = value
    }
}
#endif
