//
//  UITableView+Init.swift
//  
//
//  Created by Tiago Ferreira on 20/04/2023.
//

#if os(iOS)
import UIKit

public extension UITableView {
    convenience init(
        uiTableStyle: UITableView.Style,
        frame: CGRect = .zero,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UITableView) -> Void)? = nil
    ) {
        self.init(frame: frame, style: uiTableStyle)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    convenience init(
        uiTableStyle: UITableView.Style,
        frame: CGRect = .zero,
        style: (any UIKitStyles.Style)? = nil,
        attributes: [TableViewAttribute] = [],
        additionalChanges: ((UITableView) -> Void)? = nil
    ) {
        self.init(
            uiTableStyle: uiTableStyle,
            frame: frame,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }
}
#endif
