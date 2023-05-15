#if os(iOS)
import UIKit

public enum TextViewAttribute: Attribute {
    case isEditable(Bool)
    case scrollView(ScrollViewAttribute)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case let .isEditable(value):
            return TextViewIsEditable(value: value)
        case let .scrollView(value):
            return value.value
        case let .view(value):
            return value.value
        }
    }

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct TextViewIsEditable: Attribute {
    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let textView = view as? UITextView else { return }
        textView.isEditable = value
    }
}
#endif
