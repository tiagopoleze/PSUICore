//
//  UIKitWrapper.swift
//  
//
//  Created by Tiago Ferreira on 27/04/2023.
//

#if os(iOS)
import SwiftUI

public struct UIViewWrapper<Content: UIView>: UIViewRepresentable {
    private let initialize: (Context) -> Content
    private let updatable: ((Content, Context) -> Void)?

    public init(_ initialize: @escaping (Context) -> Content, updatable: ((Content, Context) -> Void)? = nil) {
        self.initialize = initialize
        self.updatable = updatable
    }

    public func makeUIView(context: Context) -> Content {
        initialize(context)
    }

    public func updateUIView(_ uiView: Content, context: Context) {
        updatable?(uiView, context)
    }
}

public struct UIViewControllerWrapper<Content: UIViewController>: UIViewControllerRepresentable {
    private let initialize: (Context) -> Content
    private let updatable: ((Content, Context) -> Void)?

    public init(_ initialize: @escaping (Context) -> Content, updatable: ((Content, Context) -> Void)? = nil) {
        self.initialize = initialize
        self.updatable = updatable
    }

    public func makeUIViewController(context: Context) -> Content {
        initialize(context)
    }

    public func updateUIViewController(_ uiView: Content, context: Context) {
        updatable?(uiView, context)
    }
}
#endif