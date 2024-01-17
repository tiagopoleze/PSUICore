#if os(iOS)
import UIKit

/// A enum representing the attributes for a UITextView.
public enum TextViewAttribute: Attribute {
    /// A boolean value indicating whether the text view is editable.
    case isEditable(Bool)
    /// The scroll view attributes for the text view.
    case scrollView(ScrollViewAttribute)
    /// A view attribute that represents the view to be modified.
    case view(ViewAttribute)

    /// The value of the attribute.
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

    /// Modifies the specified view by setting the attribute to the specified value.
    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

/// A struct representing an attribute that determines whether a text view is editable or not.
public struct TextViewIsEditable: Attribute {
    public var value: Bool

    /// Initializes a new instance of `TextViewIsEditable`.
    /// - Parameter value: A boolean value indicating whether the text view is editable.
    public init(value: Bool) {
        self.value = value
    }

    /// Modifies the specified view by setting its `isEditable` property to the specified value.
    /// - Parameter view: The view to be modified.
    public func modify<V>(view: V) where V: UIView {
        guard let textView = view as? UITextView else { return }
        textView.isEditable = value
    }
}
#endif
