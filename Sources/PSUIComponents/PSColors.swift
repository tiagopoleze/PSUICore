import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
public extension Color {
    static func primaryPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color(hexValue: "#247BA0")
            : Color(hexValue: "#264653")
    }
    static func secondaryPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color(hexValue: "#FFE066")
            : Color(hexValue: "#E9C46A")
    }
    static func tertiaryPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color(hexValue: "#50514F")
            : Color(hexValue: "#F4A261")
    }
    static func successPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color(hexValue: "#70C1B3")
            : Color(hexValue: "#2A9D8F")
    }
    static func dangerPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color(hexValue: "#F25F5C")
            : Color(hexValue: "#E76F51")
    }
}
