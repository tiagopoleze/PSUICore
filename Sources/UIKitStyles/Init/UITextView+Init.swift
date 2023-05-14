//
//  UITextView+Init.swift
//  
//
//  Created by Tiago Ferreira on 21/04/2023.
//

#if os(iOS)
import UIKit

public extension UITextView {
    convenience init(
        style: (any Style)? = nil,
        attributes: [TextViewAttribute] = [],
        additionalChanges: ((UITextView) -> Void)? = nil
    ) {
        self.init(style: style, attributes: attributes.map(\.value), additionalChanges: additionalChanges)
    }
}
#endif
