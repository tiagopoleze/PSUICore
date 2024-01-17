import SwiftUI

public extension Binding where Value == String {
    /// Limits the length of the string to the given length.
    /// - Parameter length: The maximum length of the string.
    /// - Returns: The modified binding.
    func limit(_ length: Int) -> Self {
        if wrappedValue.count > length {
            DispatchQueue.main.async {
                wrappedValue = String(wrappedValue.prefix(length))
            }
        }
        return self
    }
}
