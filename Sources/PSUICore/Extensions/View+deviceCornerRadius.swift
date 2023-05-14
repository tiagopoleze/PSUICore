//
//  View+deviceCornerRadius.swift
//  
//
//  Created by Tiago Ferreira on 27/04/2023.
//

#if os(iOS)
import SwiftUI

public extension View {
    var deviceCornerRadius: CGFloat {
        let key = "_displayCornerRadius"
        if let screen = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.screen {
            if let cornerRadius = screen.value(forKey: key) as? CGFloat {
                return cornerRadius
            }
        }
        return 0
    }
}
#endif
