//
//  Binding+limit.swift
//  
//
//  Created by Tiago Ferreira on 27/04/2023.
//

import SwiftUI

public extension Binding where Value == String {
    /// A helper method to limit the number of character in a string
    /// - Parameter length: the maximum size
    /// - Returns: The new String
    func limit(_ length: Int) -> Self {
        if wrappedValue.count > length {
            DispatchQueue.main.async {
                wrappedValue = String(wrappedValue.prefix(length))
            }
        }
        return self
    }
}
