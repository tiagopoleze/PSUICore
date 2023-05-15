import SwiftUI
import PSUICore

@available(iOS 15.0, macOS 12.0, *)
struct AsyncErrorView: View {
    @State var error: Error?
    var retryHandler: (() -> Void)?

    var body: some View {
        Text(error?.localizedDescription ?? "")
            .errorAlert(error: $error, buttonAction: retryHandler)
    }
}
