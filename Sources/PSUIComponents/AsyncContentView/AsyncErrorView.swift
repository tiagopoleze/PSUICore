//
//  AsyncErrorView.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

import SwiftUI
import PSUICore

/// An generic error view
struct AsyncErrorView: View {
    @State var error: Error?
    var retryHandler: (() -> Void)?

    var body: some View {
        Text(error?.localizedDescription ?? "")
            .errorAlert(error: $error, buttonAction: retryHandler)
    }
}
