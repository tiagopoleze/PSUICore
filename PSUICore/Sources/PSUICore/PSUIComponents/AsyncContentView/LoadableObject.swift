import Combine

public protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
