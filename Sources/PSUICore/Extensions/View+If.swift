//
//  View+If.swift
//  
//
//  Created by Tiago Ferreira on 08/05/2023.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
