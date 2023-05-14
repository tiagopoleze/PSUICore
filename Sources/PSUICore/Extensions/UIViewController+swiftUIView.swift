//
//  UIViewController+swiftUIView.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

#if os(iOS)
import SwiftUI

public extension UIViewController {
    /// A helper to get a SwiftUI View direct from a UIViewController
    var swiftUIView: some View {
        UIViewControllerWrapper { _ in self }
    }
}
#endif
