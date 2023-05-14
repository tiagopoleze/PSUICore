//
//  UIButton+Init.swift
//  
//
//  Created by Tiago Ferreira on 07/04/2023.
//

#if os(iOS)
import UIKit

public extension UIButton {
    convenience init(
        title: String?,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init()
        if let title { setTitle(title, for: .normal) }
        if let image { setImage(image, for: .normal) }
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    convenience init(
        title: String?,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [ButtonAttribute] = [],
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init(
            title: title,
            image: image,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }

    @available(iOS 15.0, *)
    convenience init(
        title: String? = nil,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        configuration: UIButton.Configuration,
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init(configuration: configuration)
        self.init(
            title: title,
            image: image,
            style: style,
            attributes: attributes,
            additionalChanges: additionalChanges
        )
    }

    @available(iOS 15.0, *)
    convenience init(
        title: String? = nil,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [ButtonAttribute] = [],
        configuration: UIButton.Configuration,
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init(
            title: title,
            image: image,
            style: style,
            attributes: attributes.map(\.value),
            configuration: configuration,
            additionalChanges: additionalChanges
        )
    }
}
#endif
