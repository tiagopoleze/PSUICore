public enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
