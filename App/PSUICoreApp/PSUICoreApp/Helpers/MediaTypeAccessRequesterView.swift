//
//  MediaTypeAccessRequesterView.swift
//  PSUICoreApp
//
//  Created by Tiago Ferreira on 23/12/2023.
//

import SwiftUI
import OSLog

import PSUICore

struct MediaTypeAccessRequesterView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var error: Error?
    @State private var isFinished = false
    
    var body: some View {
        Text("MediaTypeAccessRequesterView")
            .alert("MediaTypeAccessRequesterView", isPresented: $isFinished, actions: {
                Button {
                    dismiss()
                } label: {
                    Text("OK")
                }
            })
            .errorAlert(error: $error)
            .task {
                MediaTypeAccessRequester(finishAction: {
                    isFinished = true
                }, errorAction: {
                    error = NSError(domain: "MediaTypeAccessRequesterView", code: 404)
                }).request(types: [.video])
            }
    }
}

#Preview {
    MediaTypeAccessRequesterView()
}
