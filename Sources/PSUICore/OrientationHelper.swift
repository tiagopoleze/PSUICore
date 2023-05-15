#if os(iOS)
import UIKit

public protocol AppDelegate: UIApplicationDelegate {
    var orientationLock: UIInterfaceOrientationMask { get set }
}

public struct OrientationHelper {

    public static func lockOrientation<T: AppDelegate>(
        _ orientation: UIInterfaceOrientationMask,
        classType: T.Type
    ) {
        if let delegate = UIApplication.shared.delegate as? T {
            delegate.orientationLock = orientation
        }
    }

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
