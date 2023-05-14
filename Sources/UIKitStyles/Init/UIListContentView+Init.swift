//
//  UIListContentView+Init.swift
//  
//
//  Created by Tiago Ferreira on 11/05/2023.
//

#if os(iOS)
import UIKit

public extension UIListContentView {
    convenience init(
        configuration: UIListContentConfiguration,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIListContentView) -> Void)? = nil
    ) {
        self.init(configuration: configuration)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }
}
#endif
