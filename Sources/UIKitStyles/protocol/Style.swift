//
//  Style.swift
//  
//
//  Created by Tiago Ferreira on 07/04/2023.
//

#if os(iOS)
import UIKit

public protocol Style {
    associatedtype StyleAttribute: Attribute
    var attributes: [StyleAttribute] { get }
    func modify<V: UIView>(view: V)
}

public extension Style {
    func modify<V: UIView>(view: V) {
        for attribute in attributes {
            attribute.modify(view: view)
        }
    }
}
#endif