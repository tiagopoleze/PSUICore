#if os(iOS)
import UIKit

@available(iOS 14.0, *)
public extension UISegmentedControl {
    convenience init(
        frame: CGRect,
        uiActions: [UIAction],
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UISegmentedControl) -> Void)? = nil
    ) {
        self.init(frame: frame, actions: uiActions)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    convenience init(
        frame: CGRect,
        action: UIAction,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UISegmentedControl) -> Void)? = nil
    ) {
        self.init(frame: frame, primaryAction: action)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }
}

#endif
