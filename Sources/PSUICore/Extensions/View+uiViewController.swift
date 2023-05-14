//
//  View+uiViewController.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

#if os(iOS)
import SwiftUI

public extension View {
    /// Create a UIViewController direct from a View
    var uiViewController: UIViewController {
        UIHostingController(rootView: self)
    }
}
#endif
