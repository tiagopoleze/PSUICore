import AVFoundation

/// A class that requests access to media types.
final public class MediaTypeAccessRequester {
    private let finishAction: () -> Void
    private let errorAction: () -> Void

    /// Initializes a `MediaTypeAccessRequester` with the specified parameters.
    /// - Parameters:
    ///  - finishAction: A closure that is called when the access request is successful.
    /// - errorAction: A closure that is called when the access request is unsuccessful.
    /// - Returns: A new instance of `MediaTypeAccessRequester`.
    public init(finishAction: @escaping () -> Void, errorAction: @escaping () -> Void) {
        self.finishAction = finishAction
        self.errorAction = errorAction
    }

    /// Requests access to the specified media types.
    /// - Parameter mediaTypes: The media types to request access to.
    /// - Returns: A new instance of `MediaTypeAccessRequester`.
    public func request(types mediaTypes: [AVMediaType]) {
        if mediaTypes.isEmpty {
            DispatchQueue.main.async {
                self.finishAction()
            }
            return
        }

        var internalMediaTypes = mediaTypes

        let mediaType = internalMediaTypes.removeFirst()
        authorizationStatus(with: mediaType, completion: self.request(types: internalMediaTypes))
    }

    private func authorizationStatus(
        with mediaType: AVMediaType,
        completion handler: @autoclosure @escaping () -> Void
    ) {
        switch AVCaptureDevice.authorizationStatus(for: mediaType) {
        case .authorized: 
            handler()
        case .denied: 
            errorAction()
        case .notDetermined, .restricted: 
            AVCaptureDevice.requestAccess(for: mediaType) { _ in handler() }
        @unknown default: 
            errorAction()
        }
    }
}

#if os(iOS)
import UIKit

/// A extension for `MediaTypeAccessRequester` that provides additional functionality.
public extension MediaTypeAccessRequester {
    /// Initializes a `MediaTypeAccessRequester` with the specified parameters.
    /// - Parameters:
    /// - navigationController: The navigation controller to present the alert controller on.
    /// - finishAction: A closure that is called when the access request is successful.
    /// - Returns: A new instance of `MediaTypeAccessRequester`.
    convenience init(navigationController: UINavigationController, finishAction: @escaping () -> Void) {
        self.init(finishAction: finishAction) {
            MediaTypeAccessRequester.defaultErrorAction(navigationController)
        }
    }

    private static func defaultErrorAction(_ navigationController: UINavigationController) {
        // MARK: - Get the strings
        let title = "HelpTitlePermissionDenied"
        let message = "HelpDescriptionPermissionDenied"
        let buttonCancel = "buttonCancel"
        let buttonSettings = "buttonSettings"

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: buttonCancel, style: .default))
        alertController.addAction(UIAlertAction(title: buttonSettings, style: .cancel) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })

        navigationController.present(alertController, animated: true)
    }
}
#endif

#if DEBUG
import SwiftUI

@available(iOS 13.0, macOS 10.15, *)
struct MediaTypeAccessRequester_Preview: PreviewProvider {
    static var previews: some View {
        Button("Request Media type access") {
            MediaTypeAccessRequester {
                print("success")
            } errorAction: {
                print("error")
            }.request(types: [])
        }
    }
}
#endif
