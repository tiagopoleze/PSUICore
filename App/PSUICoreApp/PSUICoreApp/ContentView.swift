//
//  ContentView.swift
//  PSUICoreApp
//
//  Created by Tiago Ferreira on 23/12/2023.
//

import SwiftUI

enum NavTests {
    case mediaTypeAccessRequester
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
        .navigationDestination(for: NavTests.self) { navTest in
            switch navTest {
            case .mediaTypeAccessRequester:
                MediaTypeAccessRequesterView()
            }
        }
    }
}

#Preview {
    ContentView()
}
