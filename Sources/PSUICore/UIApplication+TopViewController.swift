//
//  UIApplication+TopViewController.swift
//  
//
//  Created by Tiago Ferreira on 27/04/2023.
//

#if os(iOS)
import UIKit

public extension UIApplication {

    static var topNavigationController: UINavigationController? {

        let keyWindow: UIWindow?
        if #available(iOS 13, *) {
            keyWindow = UIApplication.shared.connectedScenes
                .filter { $0.activationState == .foregroundActive }
                .compactMap {$0 as? UIWindowScene}
                .first?.windows
                .filter { $0.isKeyWindow } .first
        } else {
            keyWindow = UIApplication.shared.keyWindow
        }

        guard let viewController = keyWindow?.rootViewController else {
            return nil
        }
        return getNavigationController(from: viewController)
    }

    private static func getNavigationController(from viewController: UIViewController) -> UINavigationController? {
        if let nav = viewController.navigationController {
            return nav
        }

        for child in viewController.children {
            return getNavigationController(from: child)
        }

        return getNavigationController(from: viewController)
    }

    static func topViewController(viewController: UIViewController?) -> UIViewController? {
        if let navigationController = viewController as? UINavigationController {
            return topViewController(viewController: navigationController.visibleViewController)
        }

        if let tabController = viewController as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(viewController: selected)
            }
        }

        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }

        return viewController
    }
}
#endif
