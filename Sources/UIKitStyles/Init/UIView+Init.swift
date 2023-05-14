//
//  UIView+Init.swift
//  
//
//  Created by Tiago Ferreira on 07/04/2023.
//

#if os(iOS)
import UIKit

public extension UIView {
    convenience init<V: UIView>(
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((V) -> Void)? = nil
    ) {
        self.init()
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        if let self = self as? V {
            additionalChanges?(self)
        }
    }

    convenience init<V: UIView>(
        style: (any Style)? = nil,
        attributes: [ViewAttribute] = [],
        additionalChanges: ((V) -> Void)? = nil
    ) {
        self.init(style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
