//
//  UIActivityIndicatorView+Init.swift
//  
//
//  Created by Tiago Ferreira on 08/04/2023.
//

#if os(iOS)
import UIKit

public extension UIActivityIndicatorView {
    convenience init(
        activityIndicatorStyle: UIActivityIndicatorView.Style,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIActivityIndicatorView) -> Void)? = nil
    ) {
        self.init(style: activityIndicatorStyle)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    convenience init(
        activityIndicatorStyle: UIActivityIndicatorView.Style,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [ActivityIndicatorViewAttribute] = [],
        additionalChanges: ((UIActivityIndicatorView) -> Void)? = nil
    ) {
        self.init(
            activityIndicatorStyle: activityIndicatorStyle,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }
}
#endif
