#if os(iOS)
import UIKit
import PSUICore

@available(iOS 15.0, *)
class ViewController: UIViewController {

    let container = UIView(style: TamicBackgroundView()) {
        $0.layer.cornerRadius = 10
    }

    let label = UILabel(
        text: "Hello, World!",
        attributes: [
            .view(.translatesAutoresizingMaskIntoConstraints(false)),
            .accessibility("label-helloWorld"),
            .font(.boldSystemFont(ofSize: 20)),
            .textColor(.white),
            .view(.alpha(0.6))
      ]
    )

    let activityIndicator = UIActivityIndicatorView(
        activityIndicatorStyle: .large,
        attributes: [
            .view(.translatesAutoresizingMaskIntoConstraints(false)),
            .color(.systemMint)
        ]
    )

    let imageView = UIImageView(
        image: .init(systemName: "ipad.and.iphone"),
        attributes: [
            ViewTranslatesAutoresizingMaskIntoConstraints(value: false),
            ViewContentMode(value: .scaleAspectFill),
            ViewTintColor(value: .black)
        ]
    )

    let progressView = UIProgressView(
        progressViewStyle: .default,
        attributes: [
            ViewTranslatesAutoresizingMaskIntoConstraints(value: false),
            ViewTintColor(value: .green),
            ProgressViewTrackTintColor(value: .yellow)
        ])

    lazy var button = UIButton(
        title: "Tiago",
        image: .init(systemName: "iphone"),
        style: TamicBackgroundButton(accessibilityIdentifier: "button-Tiago"),
        attributes: [
            .control(
                .addTarget(
                    .init(
                        target: self,
                        action: #selector(buttonTapped),
                        event: .touchUpInside
                    )
                )
            )
        ]
    )

    let secondaryButton = UIButton(
        title: "MyButton",
        image: UIImage(systemName: "iphone"),
        style: SecondaryButton(accessibilityIdentifier: "button-accessibility")
    )

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(container)
        container.addSubview(button)
        container.addSubview(label)
        container.addSubview(activityIndicator)
        container.addSubview(imageView)
        container.addSubview(progressView)

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: container.centerYAnchor),

            label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            label.centerXAnchor.constraint(equalTo: button.centerXAnchor),

            activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20),
            imageView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: activityIndicator.topAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 50),

            progressView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            progressView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])

        activityIndicator.startAnimating()
        progressView.setProgress(0.33, animated: false)
    }

    @objc private func buttonTapped() {
        print("Tapped")
    }
}

struct TamicBackgroundView: Style {
    var attributes: [ViewAttribute] = [
        .translatesAutoresizingMaskIntoConstraints(false),
        .backgroundColor(.red)
    ]
}

struct TamicBackgroundButton: Style {
    let attributes: [ButtonAttribute]

    init(accessibilityIdentifier: String) {
        attributes = [
            .view(.translatesAutoresizingMaskIntoConstraints(false)),
            .view(.backgroundColor(.blue)),
            .setTitleColor(.init(color: .black)),
            .titleLabel(.font(.boldSystemFont(ofSize: 80))),
            .accessibility(accessibilityIdentifier)
        ]
    }
}

struct SecondaryButton: Style {
    let attributes: [ButtonAttribute]

    init(accessibilityIdentifier: String) {
        self.attributes = [
            .accessibility(accessibilityIdentifier),
            .view(.translatesAutoresizingMaskIntoConstraints(false)),
            .setTitleColor(.init(color: .systemPink)),
            .view(.backgroundColor(.clear)),
            .view(
                .border(
                    .init(
                        cornerRadius: 4,
                        borderWidth: 1,
                        borderColor: .systemPink
                    )
                )
            ),
            .titleLabel(.font(.preferredFont(forTextStyle: .title1)))
        ]
    }
}

import SwiftUI
@available(iOS 15.0, *)
struct TestProvider: PreviewProvider {
    static var previews: some View {
        UIViewControllerWrapper { _ in
            ViewController()
        }
    }
}
#endif
