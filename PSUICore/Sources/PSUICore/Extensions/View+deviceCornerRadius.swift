#if os(iOS)
import SwiftUI

public extension View {
    /// Returns the corner radius of the device.
    var deviceCornerRadius: CGFloat {
        let key = "_displayCornerRadius"
        if let screen = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.screen {
            if let cornerRadius = screen.value(forKey: key) as? CGFloat {
                return cornerRadius
            }
        }
        return 0
    }
}
#endif
