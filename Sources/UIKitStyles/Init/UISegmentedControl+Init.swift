//
//  UISegmentedControl+Init.swift
//  
//
//  Created by Tiago Ferreira on 11/05/2023.
//

#if os(iOS)
import UIKit

public extension UISegmentedControl {
    convenience init(
        frame: CGRect,
        actions: [UIAction],
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UISegmentedControl) -> Void)? = nil
    ) {
        self.init(frame: frame, actions: actions)
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
