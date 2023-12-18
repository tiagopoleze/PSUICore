#if os(iOS)
import UIKit

/// Enum that represents attributes for a UIPickerView.
public enum PickerViewAttribute: Attribute {
    /// The data source for the UIPickerView.
    case dataSource(UIPickerViewDataSource)
    /// The delegate for the UIPickerView.
    case delegate(UIPickerViewDelegate)
    /// A view attribute.
    case view(ViewAttribute)

    /// The value associated with the attribute.
    public var value: any Attribute {
        switch self {
        case .dataSource(let uIPickerViewDataSource):
            return PickerViewDataSource(value: uIPickerViewDataSource)
        case .delegate(let uIPickerViewDelegate):
            return PickerViewDelegate(value: uIPickerViewDelegate)
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    /// Modifies the specified view based on the attribute.
    ///
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct that represents an attribute for a UIPickerView's data source.
public struct PickerViewDataSource: Attribute {
    /// The value of the data source.
    public let value: UIPickerViewDataSource

    /// Initializes a new instance of PickerViewDataSource.
    /// - Parameter value: The value of the data source.
    public init(value: UIPickerViewDataSource) {
        self.value = value
    }

    /// Modifies the specified view by setting its data source to the value of this attribute.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let pickerView = view as? UIPickerView else { return }
        pickerView.dataSource = value
    }
}

/// A struct that represents an attribute for a UIPickerView delegate.
public struct PickerViewDelegate: Attribute {
    public let value: UIPickerViewDelegate

    /// Initializes a new instance of the PickerViewDelegate struct.
    /// - Parameter value: The UIPickerViewDelegate to be assigned to the attribute.
    public init(value: UIPickerViewDelegate) {
        self.value = value
    }

    /// Modifies the specified view by assigning the UIPickerViewDelegate to its delegate property.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let pickerView = view as? UIPickerView else { return }
        pickerView.delegate = value
    }
}

#endif
