#if os(iOS)
import SwiftUI

public extension UIViewController {
    /// Adds the specified view controller to the container view.
    var swiftUIView: some View {
        UIViewControllerWrapper { _ in self }
    }
}
#endif
