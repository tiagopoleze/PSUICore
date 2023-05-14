import SwiftUI
import PSCore

@available(iOS 15.0, macOS 12.0, *)
public extension View {
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

@available(iOS 14.0, macOS 12, *)
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
        print(localizedError, logLevel: .error)
        underlyingError = localizedError
    }
}
