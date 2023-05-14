//
//  ListContentViewAttribute.swift
//  
//
//  Created by Tiago Ferreira on 11/05/2023.
//

#if os(iOS)
import UIKit

public enum ListContentViewAttribute: Attribute {
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case .view(let viewAttribute):
            return viewAttribute.value
        }
    }

    public func modify<V>(view: V) where V : UIView {
        value.modify(view: view)
    }
}
#endif
