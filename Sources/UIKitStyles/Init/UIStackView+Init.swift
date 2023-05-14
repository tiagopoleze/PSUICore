//
//  UIStackView+Init.swift
//  
//
//  Created by Tiago Ferreira on 21/04/2023.
//

#if os(iOS)
import UIKit

public extension UIStackView {
    convenience init(
        arrangedSubviews: [UIView] = [],
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIStackView) -> Void)? = nil
    ) {
        self.init(arrangedSubviews: arrangedSubviews)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    convenience init(
        arrangedSubviews: [UIView] = [],
        style: (any Style)? = nil,
        attributes: [StackViewAttribute] = [],
        additionalChanges: ((UIStackView) -> Void)? = nil
    ) {
        self.init(
            arrangedSubviews: arrangedSubviews,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }
}
#endif
