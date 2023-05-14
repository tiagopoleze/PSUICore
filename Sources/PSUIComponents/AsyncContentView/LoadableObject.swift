import Combine

@available(iOS 13.0, macOS 10.15, *)
public protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
