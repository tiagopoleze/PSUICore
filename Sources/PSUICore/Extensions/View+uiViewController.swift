#if os(iOS)
import SwiftUI

@available(iOS 13.0, *)
public extension View {
    var uiViewController: UIViewController {
        UIHostingController(rootView: self)
    }
}
#endif
