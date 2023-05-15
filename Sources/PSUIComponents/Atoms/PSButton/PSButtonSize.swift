import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
public enum PSButtonSize {
    case small
    case medium

    var font: Font {
        switch self {
        case .small:
            return Font.subheadline.weight(.semibold)
        case .medium:
            return Font.body.weight(.semibold)
        }
    }

    var controleSize: ControlSize {
        switch self {
        case .small:
            return .small
        case .medium:
            return .regular
        }
    }
}
