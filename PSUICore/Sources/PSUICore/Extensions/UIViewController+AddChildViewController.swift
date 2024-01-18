#if os(iOS)
import UIKit

public extension UIViewController {
    /// Adds the specified view controller to the container view.
    /// - Parameters:
    /// - viewController: The view controller to add to the container view.
    /// - container: The container view to add the view controller to.
    /// - Returns: A new view controller with the specified view controller added to the container view.
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
