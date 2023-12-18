#if os(iOS)
import SwiftUI

/// A wrapper for a `UIView` that can be used in SwiftUI.
public struct UIViewWrapper<Content: UIView>: UIViewRepresentable {
    private let initialize: (Context) -> Content
    private let updatable: ((Content, Context) -> Void)?

    /// Creates a new wrapper for a `UIView` that can be used in SwiftUI.
    /// - Parameters:
    /// - initialize: A closure that initializes the `UIView`.
    /// - updatable: A closure that updates the `UIView`.
    /// - Returns: A new wrapper for a `UIView` that can be used in SwiftUI.
    public init(_ initialize: @escaping (Context) -> Content, updatable: ((Content, Context) -> Void)? = nil) {
        self.initialize = initialize
        self.updatable = updatable
    }

    /// Creates the `UIView`.
    /// - Parameter context: The context of the `UIView`.
    /// - Returns: The created `UIView`.
    /// - Note: This method is called once when the view is created.
    public func makeUIView(context: Context) -> Content {
        initialize(context)
    }

    /// Updates the `UIView`.
    /// - Parameters:
    /// - uiView: The `UIView` to update.
    /// - context: The context of the `UIView`.
    /// - Note: This method is called when the view is updated.
    public func updateUIView(_ uiView: Content, context: Context) {
        updatable?(uiView, context)
    }
}

/// A wrapper for a `UIViewController` that can be used in SwiftUI.
public struct UIViewControllerWrapper<Content: UIViewController>: UIViewControllerRepresentable {
    private let initialize: (Context) -> Content
    private let updatable: ((Content, Context) -> Void)?

    /// Creates a new wrapper for a `UIViewController` that can be used in SwiftUI.
    /// - Parameters:
    /// - initialize: A closure that initializes the `UIViewController`.
    /// - updatable: A closure that updates the `UIViewController`.
    /// - Returns: A new wrapper for a `UIViewController` that can be used in SwiftUI.
    public init(_ initialize: @escaping (Context) -> Content, updatable: ((Content, Context) -> Void)? = nil) {
        self.initialize = initialize
        self.updatable = updatable
    }

    /// Creates the `UIViewController`.
    /// - Parameter context: The context of the `UIViewController`.
    /// - Returns: The created `UIViewController`.
    /// - Note: This method is called once when the view is created.
    public func makeUIViewController(context: Context) -> Content {
        initialize(context)
    }

    /// Updates the `UIViewController`.
    /// - Parameters:
    /// - uiView: The `UIViewController` to update.
    /// - context: The context of the `UIViewController`.
    /// - Note: This method is called when the view is updated.
    public func updateUIViewController(_ uiView: Content, context: Context) {
        updatable?(uiView, context)
    }
}
#endif
