import SwiftUI

/// Represents a shadow configuration for a UI element.
public struct DSColor {
    /// The primary color.
    public var primary: DSPrimary
    /// The secondary color.
    public var secondary: DSSecondary
    /// The success color.
    public var success: DSSuccess
    /// The danger color.
    public var danger: DSDanger
    /// The text color.
    public var text: DSText
    
    /// Initializes a new instance of `DSColor` with the specified colors.
    /// - Parameters:
    ///  - primary: The primary color.
    /// - secondary: The secondary color.
    /// - success: The success color.
    /// - danger: The danger color.
    /// - text: The text color.
    /// - Returns: A new instance of `DSColor`.
    public init(primary: DSPrimary, secondary: DSSecondary, success: DSSuccess, danger: DSDanger, text: DSText) {
        self.primary = primary
        self.secondary = secondary
        self.success = success
        self.danger = danger
        self.text = text
    }
}
extension DSColor: Codable { }
extension DSColor {
    static var mock: DSColor {
        DSColor(primary: DSPrimary.mock, secondary: DSSecondary.mock, success: DSSuccess.mock, danger: DSDanger.mock, text: DSText.mock)
    }
}

/// Represents the primary color for the design system.
public struct DSPrimary {
    /// The light color of the primary color.
    public var light: DSPrimitiveColor
    /// The default color of the primary color.
    public var `default`: DSPrimitiveColor
    /// The dark color of the primary color.
    public var dark: DSPrimitiveColor
    
    /// Initializes a new instance of `DSPrimary` with the specified colors.
    /// - Parameters:
    /// - light: The light color of the primary color.
    /// - defaultColor: The default color of the primary color.
    /// - dark: The dark color of the primary color.
    /// - Returns: A new instance of `DSPrimary`.
    public init(light: DSPrimitiveColor, defaultColor: DSPrimitiveColor, dark: DSPrimitiveColor) {
        self.light = light
        self.default = defaultColor
        self.dark = dark
    }
}
extension DSPrimary: Codable { }
extension DSPrimary {
    static var mock: DSPrimary {
        DSPrimary(light: DSPrimitiveColor.primaryLightMock, defaultColor: DSPrimitiveColor.primaryDefaultMock, dark: DSPrimitiveColor.primaryDarkMock)
    }
}
extension DSPrimitiveColor {
    static var primaryLightMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var primaryDefaultMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var primaryDarkMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
}

/// Represents the secondary color for the design system.
public struct DSSecondary {
    /// The light color of the secondary color.
    public var light: DSPrimitiveColor
    /// The default color of the secondary color.
    public var `default`: DSPrimitiveColor
    /// The dark color of the secondary color.
    public var dark: DSPrimitiveColor
    
    /// Initializes a new instance of `DSSecondary` with the specified colors.
    /// - Parameters:
    /// - light: The light color of the secondary color.
    /// - defaultColor: The default color of the secondary color.
    /// - dark: The dark color of the secondary color.
    /// - Returns: A new instance of `DSSecondary`.
    public init(light: DSPrimitiveColor, defaultColor: DSPrimitiveColor, dark: DSPrimitiveColor) {
        self.light = light
        self.dark = dark
        self.default = defaultColor
    }
}
extension DSSecondary: Codable { }
extension DSSecondary {
    static var mock: DSSecondary {
        DSSecondary(light: DSPrimitiveColor.secondaryLightMock, defaultColor: DSPrimitiveColor.secondaryDefaultMock, dark: DSPrimitiveColor.secondaryDarkMock)
    }
}
extension DSPrimitiveColor {
    static var secondaryLightMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var secondaryDefaultMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var secondaryDarkMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
}

/// Represents the success color for the design system.
public struct DSSuccess {
    /// The light color of the success color.
    public var light: DSPrimitiveColor
    /// The default color of the success color.
    public var `default`: DSPrimitiveColor
    /// The dark color of the success color.
    public var dark: DSPrimitiveColor
    
    /// Initializes a new instance of `DSSuccess` with the specified colors.
    /// - Parameters:
    /// - light: The light color of the success color.
    /// - defaultColor: The default color of the success color.
    /// - dark: The dark color of the success color.
    /// - Returns: A new instance of `DSSuccess`.
    public init(light: DSPrimitiveColor, defaultColor: DSPrimitiveColor, dark: DSPrimitiveColor) {
        self.light = light
        self.dark = dark
        self.default = defaultColor
    }
}
extension DSSuccess: Codable { }
extension DSSuccess {
    static var mock: DSSuccess {
        DSSuccess(light: DSPrimitiveColor.successLightMock, defaultColor: DSPrimitiveColor.successDefaultMock, dark: DSPrimitiveColor.successDarkMock)
    }
}
extension DSPrimitiveColor {
    static var successLightMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var successDefaultMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var successDarkMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
}

/// Represents the danger color for the design system.
public struct DSDanger {
    /// The light color of the danger color.
    public var light: DSPrimitiveColor
    /// The default color of the danger color.
    public var `default`: DSPrimitiveColor
    /// The dark color of the danger color.
    public var dark: DSPrimitiveColor
    
    /// Initializes a new instance of `DSDanger` with the specified colors.
    /// - Parameters:
    /// - light: The light color of the danger color.
    /// - defaultColor: The default color of the danger color.
    /// - dark: The dark color of the danger color.
    /// - Returns: A new instance of `DSDanger`.
    public init(light: DSPrimitiveColor, defaultColor: DSPrimitiveColor, dark: DSPrimitiveColor) {
        self.light = light
        self.dark = dark
        self.default = defaultColor
    }
}
extension DSDanger: Codable { }
extension DSDanger {
    static var mock: DSDanger {
        DSDanger(light: DSPrimitiveColor.dangerLightMock, defaultColor: DSPrimitiveColor.dangerDefaultMock, dark: DSPrimitiveColor.dangerDarkMock)
    }
}
extension DSPrimitiveColor {
    static var dangerLightMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var dangerDefaultMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
    static var dangerDarkMock: DSPrimitiveColor { DSPrimitiveColor(lightMode: .blue, darkMode: .blue) }
}

/// Represents the text color for the design system.
public struct DSText {
    /// The default color of the text.
    public var `default`: DSPrimitiveColor
    /// The support color of the text.
    public var support: DSPrimitiveColor
    /// The disable color of the text.
    public var disable: DSPrimitiveColor
    
    /// Initializes a new instance of `DSText` with the specified colors.
    /// - Parameters:
    /// - defaultColor: The default color of the text.
    /// - support: The support color of the text.
    /// - disable: The disable color of the text.
    /// - Returns: A new instance of `DSText`.
    public init(_ defaultColor: DSPrimitiveColor, support: DSPrimitiveColor, disable: DSPrimitiveColor) {
        self.support = support
        self.default = defaultColor
        self.disable = disable
    }
}
extension DSText: Codable {}
extension DSText {
    static var mock: DSText {
        DSText(DSPrimitiveColor.mockTextDefault, support: DSPrimitiveColor.mockTextSupport, disable: DSPrimitiveColor.textDisableMock)
    }
}
extension DSPrimitiveColor {
    static var mockTextDefault: DSPrimitiveColor {
        DSPrimitiveColor(lightMode: .primary, darkMode: .secondary)
    }
    
    static var mockTextSupport: DSPrimitiveColor {
        DSPrimitiveColor(lightMode: .gray, darkMode: .white.opacity(0.8))
    }
    
    static var textDisableMock: DSPrimitiveColor {
        DSPrimitiveColor(lightMode: .gray.opacity(0.5), darkMode: .white.opacity(0.4))
    }
}

/// Represents a primitive color for the design system.
public struct DSPrimitiveColor {
    
    @Environment(\.colorScheme) private var colorScheme
    /// The light color of the primitive color.
    public var lightMode: SwiftUI.Color
    /// The dark color of the primitive color.
    public var darkMode: SwiftUI.Color
    
    /// Initializes a new instance of `DSPrimitiveColor` with the specified colors.
    /// - Parameters:
    /// - lightMode: The light color of the primitive color.
    /// - darkMode: The dark color of the primitive color.
    /// - Returns: A new instance of `DSPrimitiveColor`.
    public init(lightMode: SwiftUI.Color, darkMode: SwiftUI.Color) {
        self.lightMode = lightMode
        self.darkMode = darkMode
    }
    
    /// Returns the color based on the current color scheme.
    /// - Returns: The color based on the current color scheme.
    public func color() -> SwiftUI.Color {
        switch colorScheme {
        case .dark: 
            return darkMode
        case .light: 
            return lightMode
        default: 
            return lightMode
        }
    }
}
extension DSPrimitiveColor: Codable {
    enum CodingKeys: CodingKey {
        case lightMode, darkMode
    }
    
    /// Initializes a `DSColor` instance from a decoder.
    /// Parameter decoder: The decoder to read data from.
    /// Throws: An error if the decoding process fails.
    /// Returns: A new instance of `DSColor`.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let lightModeHex = try container.decode(String.self, forKey: .lightMode)
        let darkModeHex = try container.decode(String.self, forKey: .darkMode)
        lightMode = SwiftUI.Color(hexValue: lightModeHex)
        darkMode = SwiftUI.Color(hexValue: darkModeHex)
    }
    
    /// Encodes this value into the given encoder.
    /// Parameter encoder: The encoder to write data to.
    /// Throws: An error if any values are invalid for the given encoder's format.
    /// Returns: A new instance of this type encoded into the given encoder.
    public func encode(to encoder: Encoder) throws {
        let lightModeHex = lightMode.hexValue
        let darkModeHex = darkMode.hexValue
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lightModeHex, forKey: .lightMode)
        try container.encode(darkModeHex, forKey: .darkMode)
    }
}
