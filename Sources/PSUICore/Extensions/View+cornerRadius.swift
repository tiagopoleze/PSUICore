//
//  View+cornerRadius.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

#if os(iOS)
import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var style: RoundedCornerStyle = .continuous
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

public extension View {
    /// A helper function to add some corner radius
    /// - Parameters:
    ///   - radius: The radius you want
    ///   - antialiased: The antialiased
    ///   - corners: The corner you need
    /// - Returns: the return of new view
    func cornerRadius(_ radius: CGFloat, antialiased: Bool = true, corners: UIRectCorner) -> some View {
        clipShape(
            RoundedCorner(radius: radius, style: antialiased ? .continuous : .circular, corners: corners)
        )
    }
}
#endif
