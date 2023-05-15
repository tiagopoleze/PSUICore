#if os(iOS)
import UIKit

public extension UIViewController {

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
