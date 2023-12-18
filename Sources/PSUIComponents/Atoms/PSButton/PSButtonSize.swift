import SwiftUI

/// PSButtonSize is a enum that defines the size of the button.
public enum PSButtonSize {
    /// Small button size.
    case small
    /// Medium button size.
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
