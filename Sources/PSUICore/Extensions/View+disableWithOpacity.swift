//
//  View+disableWithOpacity.swift
//  
//
//  Created by Tiago Ferreira on 27/04/2023.
//

import SwiftUI

public extension View {
    /// A helper method to disable a View
    /// - Parameters:
    ///   - condition: the condition you need check
    ///   - opacity: the opacity you need
    /// - Returns: The new view returned
    func disableWithOpacity(_ condition: Bool, opacity: CGFloat = 0.6) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? opacity : 1)
    }
}
