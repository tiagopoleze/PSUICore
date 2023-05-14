//
//  UIViewController+AddChildViewController.swift
//  
//
//  Created by Tiago Ferreira on 27/04/2023.
//

#if os(iOS)
import UIKit

public extension UIViewController {

    /// A helper function to add a UIViewController o top of a container
    /// - Parameters:
    ///   - viewController: The next UIViewController
    ///   - container: the container that the viewController will be placed
    func add(viewController: UIViewController, in container: UIView) {
        viewController.navigationController?.navigationBar.isHidden = true
        viewController.modalPresentationStyle = .fullScreen

        addChild(viewController)
        container.addSubview(viewController.view)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewController.view.topAnchor.constraint(equalTo: container.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])

        viewController.didMove(toParent: self)
    }
}
#endif
