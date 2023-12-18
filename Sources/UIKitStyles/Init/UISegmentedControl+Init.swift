#if os(iOS)
import UIKit

@available(iOS 14.0, *)
/// Convenience initializers for `UISegmentedControl` with additional styling options.
public extension UISegmentedControl {
    
    /// Initializes a segmented control with the specified frame, UI actions, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - frame: The frame rectangle for the segmented control, measured in points.
    ///   - uiActions: An array of UI actions to associate with the segmented control.
    ///   - style: The style to apply to the segmented control. Defaults to `nil`.
    ///   - attributes: An array of attributes to modify the segmented control. Defaults to an empty array.
    ///   - additionalChanges: A closure that allows for additional changes to be made to the segmented control. Defaults to `nil`.
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

    /// Initializes a segmented control with the specified frame, UI action, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - frame: The frame rectangle for the segmented control, measured in points.
    ///   - action: The UI action to associate with the segmented control.
    ///   - style: The style to apply to the segmented control. Defaults to `nil`.
    ///   - attributes: An array of attributes to modify the segmented control. Defaults to an empty array.
    ///   - additionalChanges: A closure that allows for additional changes to be made to the segmented control. Defaults to `nil`.
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
