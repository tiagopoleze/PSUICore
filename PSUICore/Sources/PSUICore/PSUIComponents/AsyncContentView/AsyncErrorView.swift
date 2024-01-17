import SwiftUI

struct AsyncErrorView {
    @State var error: Error?
    var retryHandler: (() -> Void)?
}

extension AsyncErrorView: View {
    var body: some View {
        Text(error?.localizedDescription ?? "").errorAlert(error: $error, buttonAction: retryHandler)
    }
}
