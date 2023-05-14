//
//  View+ErrorAlert.swift
//  
//
//  Created by Tiago Ferreira on 27/04/2023.
//

import SwiftUI
import PSCore

public extension View {

    /// A helper modifier to show an error view
    /// - Parameters:
    ///   - error: The error to show
    ///   - buttonTitle: The button title
    ///   - buttonAction: the action when the button is pressed
    /// - Returns: The new View
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
        print(localizedError, logLevel: .error)
        underlyingError = localizedError
    }
}
