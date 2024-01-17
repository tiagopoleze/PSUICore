/// Represents the different states of loading content asynchronously.
public enum LoadingState<Value> {
    /// - idle: The initial state when no loading has occurred.
    case idle
    /// - loading: The state when content is being loaded.
    case loading
    /// - failed: The state when loading content has failed, with an associated error.
    case failed(Error)
    /// - loaded: The state when content has been successfully loaded, with an associated value.
    case loaded(Value)
}
