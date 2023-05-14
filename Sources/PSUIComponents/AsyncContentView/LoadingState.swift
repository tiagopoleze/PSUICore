//
//  LoadingState.swift
//  
//
//  Created by Tiago Ferreira on 28/04/2023.
//

/// The states of the Loading View
public enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
