import SwiftUI
import OSLog

public extension View {
    /// Presents an alert to the user when the specified error is non-nil.
    /// - Parameters:
    ///  - isPresented: A binding to whether the alert is presented.
    /// - error: The error to present.
    /// - buttonTitle: The title of the button that dismisses the alert.
    /// - buttonAction: The action to perform when the button is tapped.
    /// - Returns: A new view that presents an alert when the specified error is non-nil.
    func errorAlert(
        error: Binding<Error?>,
        buttonTitle: String = "OK",
        buttonAction: (() -> Void)? = nil
    ) -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
                buttonAction?()
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}

private struct LocalizedAlertError: LocalizedError {
    let underlyingError: LocalizedError
    var errorDescription: String? {
        underlyingError.errorDescription
    }
    var recoverySuggestion: String? {
        underlyingError.recoverySuggestion
    }

    init?(error: Error?) {
        guard let localizedError = error as? LocalizedError else { return nil }
        Logger.psUICore.error("\(localizedError)")
        underlyingError = localizedError
    }
}
