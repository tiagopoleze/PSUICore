import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
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

    @ViewBuilder
    func `ifElse`<Content: View>(
        _ condition: Bool,
        transformIf: (Self) -> Content,
        transformElse: (Self) -> Content
    ) -> some View {
        if condition {
            transformIf(self)
        } else {
            transformElse(self)
        }
    }
}
