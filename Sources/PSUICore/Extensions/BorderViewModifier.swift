//
//  BorderViewModifier.swift
//  
//
//  Created by Tiago Ferreira on 11/05/2023.
//

import SwiftUI

private struct RoundedBorderViewModifier: ViewModifier {
    let cornerRadius: CGFloat
    let color: Color
    let lineWidth: CGFloat

    init(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) {
        self.cornerRadius = cornerRadius
        self.color = color
        self.lineWidth = lineWidth
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

public extension View {
    func roundedBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(RoundedBorderViewModifier(cornerRadius: cornerRadius, color: color, lineWidth: lineWidth))
    }
}

private struct RectangleBorderViewModifier: ViewModifier {
    let color: Color
    let lineWidth: CGFloat

    init(color: Color, lineWidth: CGFloat) {
        self.color = color
        self.lineWidth = lineWidth
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

public extension View {
    func rectangleBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(RectangleBorderViewModifier(color: color, lineWidth: lineWidth))
    }
}

private struct CircleBorderViewModifier: ViewModifier {
    let color: Color
    let lineWidth: CGFloat

    init(color: Color, lineWidth: CGFloat) {
        self.color = color
        self.lineWidth = lineWidth
    }

    func body(content: Content) -> some View {
        content
            .overlay(
                Circle()
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

public extension View {
    func circleBorder(cornerRadius: CGFloat, color: Color, lineWidth: CGFloat) -> some View {
        modifier(CircleBorderViewModifier(color: color, lineWidth: lineWidth))
    }
}
