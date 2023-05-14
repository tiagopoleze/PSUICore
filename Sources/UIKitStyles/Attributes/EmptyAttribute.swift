//
//  EmptyAttribute.swift
//  
//
//  Created by Tiago Ferreira on 21/04/2023.
//

#if os(iOS)
import UIKit

struct EmptyAttribute: Attribute {
    let value: () = Void()

    func modify<V>(view: V) where V: UIView { }
}
#endif
