#if os(iOS)
import UIKit

/// A protocol that defines an app delegate.
public protocol AppDelegate: UIApplicationDelegate {
    var orientationLock: UIInterfaceOrientationMask { get set }
}

/// A helper class for orientation.
public struct OrientationHelper {

    /// Locks the orientation to the specified orientation.
    /// - Parameters:
    /// - orientation: The orientation to lock to.
    /// - classType: The type of the app delegate.
    /// - Note: This method is an extension on the `OrientationHelper` struct.
    public static func lockOrientation<T: AppDelegate>(
        _ orientation: UIInterfaceOrientationMask,
        classType: T.Type
    ) {
        if let delegate = UIApplication.shared.delegate as? T {
            delegate.orientationLock = orientation
        }
    }

    /// Locks the orientation of the application to the specified orientation mask and rotates the interface to the specified orientation.
    /// - Parameters:
    ///     - orientation: The orientation mask to lock the application to.
    ///     - classType: The type of the AppDelegate.
    ///     - rotateOrientation: The orientation to rotate the interface to.
    /// - Note: This method should be called from the AppDelegate's `application(_:didFinishLaunchingWithOptions:)` method.
    public static func lockOrientation<T: AppDelegate>(
        _ orientation: UIInterfaceOrientationMask,
        classType: T.Type,
        andRotateTo rotateOrientation: UIInterfaceOrientation
    ) {

        if isDelegateInApplication {
            self.lockOrientation(orientation, classType: classType)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        } else {
            NotificationCenter.default.post(name: UIDevice.orientationDidChangeNotification, object: orientation)
            if #unavailable(iOS 16) {
                UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
            }
        }

        if #available(iOS 16, *) {
            UIApplication.topNavigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }

    private static var isDelegateInApplication: Bool {
        (UIApplication.shared.delegate as? AppDelegate) != nil
    }
}
#endif
