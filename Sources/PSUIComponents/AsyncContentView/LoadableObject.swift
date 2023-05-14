//
//  LoadableObject.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

import Combine

/// The protocol that the ViewModel needs to conforms
public protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
