import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
public extension View {
    func disableWithOpacity(_ condition: Bool, opacity: CGFloat = 0.6) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? opacity : 1)
    }
}
