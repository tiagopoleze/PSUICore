//
//  UILabel+Init.swift
//  
//
//  Created by Tiago Ferreira on 08/04/2023.
//

#if os(iOS)
import UIKit

public extension UILabel {
    convenience init(
        text: String?,
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UILabel) -> Void)? = nil
    ) {
        self.init()
        self.text = text
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    convenience init(
        text: String?,
        style: (any Style)? = nil,
        attributes: [LabelAttribute] = [],
        additionalChanges: ((UILabel) -> Void)? = nil
    ) {
        self.init(text: text, style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
