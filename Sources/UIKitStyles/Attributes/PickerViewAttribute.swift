#if os(iOS)
import UIKit

public enum PickerViewAttribute: Attribute {
    case dataSource(UIPickerViewDataSource)
    case delegate(UIPickerViewDelegate)
    case view(ViewAttribute)

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

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}

public struct PickerViewDataSource: Attribute {
    public let value: UIPickerViewDataSource

    public init(value: UIPickerViewDataSource) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let pickerView = view as? UIPickerView else { return }
        pickerView.dataSource = value
    }
}

public struct PickerViewDelegate: Attribute {
    public let value: UIPickerViewDelegate

    public init(value: UIPickerViewDelegate) {
        self.value = value
    }

    public func modify<V>(view: V) where V : UIView {
        guard let pickerView = view as? UIPickerView else { return }
        pickerView.delegate = value
    }
}

#endif
