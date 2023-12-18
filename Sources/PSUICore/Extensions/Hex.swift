#if os(iOS)
import UIKit

/// An extension of UIColor that provides methods for working with hexadecimal color values.
public extension UIColor {
    /// The hex value of the UIColor
    var hexValue: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier = CGFloat(255.999999)

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        } else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }

    /// Initializes a `UIColor` with the specified hex value.
    /// - Parameter hexValue: The hex value to initialize the `UIColor` with.
    /// - Returns: A new instance of `UIColor`.
    convenience init(hexValue: String) {
        let hex = hexValue.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var uInt64 = UInt64()
        guard Scanner(string: hex).scanHexInt64(&uInt64) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3:
            (alpha, red, green, blue) = (255, (uInt64 >> 8) * 17, (uInt64 >> 4 & 0xF) * 17, (uInt64 & 0xF) * 17)
        case 6:
            (alpha, red, green, blue) = (255, uInt64 >> 16, uInt64 >> 8 & 0xFF, uInt64 & 0xFF)
        case 8:
            (alpha, red, green, blue) = (uInt64 >> 24, uInt64 >> 16 & 0xFF, uInt64 >> 8 & 0xFF, uInt64 & 0xFF)
        default:
            (alpha, red, green, blue) = (255, 0, 0, 0)
        }
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: CGFloat(alpha) / 255
        )
    }
}
#endif

#if os(macOS)
import AppKit

/// An extension of NSColor that provides methods for working with hexadecimal color values.
public extension NSColor {
    /// The hex value of the UIColor
    var hexValue: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier = CGFloat(255.999999)
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        } else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }

    /// Initializes a `NSColor` with the specified hex value.
    /// - Parameter hexValue: The hex value to initialize the `NSColor` with.
    /// - Returns: A new instance of `NSColor`.
    convenience init(hexValue: String) {
        let hex = hexValue.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var uInt64 = UInt64()
        guard Scanner(string: hex).scanHexInt64(&uInt64) else {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3:
            (alpha, red, green, blue) = (255, (uInt64 >> 8) * 17, (uInt64 >> 4 & 0xF) * 17, (uInt64 & 0xF) * 17)
        case 6:
            (alpha, red, green, blue) = (255, uInt64 >> 16, uInt64 >> 8 & 0xFF, uInt64 & 0xFF)
        case 8:
            (alpha, red, green, blue) = (uInt64 >> 24, uInt64 >> 16 & 0xFF, uInt64 >> 8 & 0xFF, uInt64 & 0xFF)
        default:
            (alpha, red, green, blue) = (255, 0, 0, 0)
        }
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: CGFloat(alpha) / 255
        )
    }
}
#endif

import SwiftUI

/// An extension of Color that provides methods for working with hexadecimal color values.
public extension Color {
    /// The hex value of the Color
    var hexValue: String? {
#if canImport(UIKit)
        return UIColor(self).hexValue
#elseif canImport(AppKit)
        return NSColor(self).hexValue
#else
        return nil
#endif
    }

    /// Initializes a `Color` with the specified hex value.
    /// - Parameter hexValue: The hex value to initialize the `Color` with.
    /// - Returns: A new instance of `Color`.
    init(hexValue: String) {
#if canImport(UIKit)
        self = Color(uiColor: UIColor(hexValue: hexValue))
#elseif canImport(AppKit)
        self = Color(nsColor: NSColor(hexValue: hexValue))
#endif
    }
}
