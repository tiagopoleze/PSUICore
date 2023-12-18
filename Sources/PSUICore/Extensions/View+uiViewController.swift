#if os(iOS)
import SwiftUI

public extension View {
    /// Adds the specified view controller to the container view.
    var uiViewController: UIViewController {
        UIHostingController(rootView: self)
    }
}
#endif
