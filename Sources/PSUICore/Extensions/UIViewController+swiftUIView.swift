#if os(iOS)
import SwiftUI

@available(iOS 13.0, *)
public extension UIViewController {
    var swiftUIView: some View {
        UIViewControllerWrapper { _ in self }
    }
}
#endif
