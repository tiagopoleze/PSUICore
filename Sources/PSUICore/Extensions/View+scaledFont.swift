//
//  View+scaledFont.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

#if os(iOS)
import SwiftUI

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: CGFloat

    public func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}

public extension View {
    /// A modifier to add some scalable fonts
    /// - Parameters:
    ///   - font: The custom font
    ///   - size: the size you want
    /// - Returns: The new view
    func custom(font: String, size: CGFloat) -> some View {
        return scaledFont(name: font, size: size)
    }

    private func scaledFont(name: String, size: CGFloat) -> some View {
        return self.modifier(ScaledFont(name: name, size: size))
    }
}
#endif
