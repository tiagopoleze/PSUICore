import SwiftUI

/// Represents a shadow configuration for a UI element.
public struct DSShadow {
    /// The shadow type for small size.
    public var sm: DSShadowType
    /// The shadow type for medium size.
    public var md: DSShadowType
    /// The shadow type for large size.
    public var lg: DSShadowType
    
    /// Initializes a new instance of `DSShadow` with the specified shadow types.
        ///
        /// - Parameters:
        ///   - sm: The shadow type for small size.
        ///   - md: The shadow type for medium size.
        ///   - lg: The shadow type for large size.
        public init(sm: DSShadowType, md: DSShadowType, lg: DSShadowType) {
            self.sm = sm
            self.md = md
            self.lg = lg
        }
}
extension DSShadow: Codable {}
extension DSShadow {
    static var mock: DSShadow {
        DSShadow(sm: DSShadowType.mockSM, md: DSShadowType.mockMD, lg: DSShadowType.mockLG)
    }
}

/// Represents a shadow type for a UI element.
public struct DSShadowType {
    /// The light color of the shadow.
    /// The dark color of the shadow.
    public var light: SwiftUI.Color
    /// The dark color of the shadow.
    public var dark: SwiftUI.Color
    /// The radius of the shadow.
    public var radius: CGFloat
    /// The horizontal offset of the shadow.
    public var x: CGFloat
    /// The vertical offset of the shadow.
    public var y: CGFloat
    
    /// Initializes a DSShadow object with the specified light and dark colors, radius, x and y offsets.
        ///
        /// - Parameters:
        ///   - light: The light color of the shadow.
        ///   - dark: The dark color of the shadow.
        ///   - radius: The radius of the shadow.
        ///   - x: The horizontal offset of the shadow.
        ///   - y: The vertical offset of the shadow.
        public init(light: SwiftUI.Color, dark: SwiftUI.Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
            self.light = light
            self.dark = dark
            self.radius = radius
            self.x = x
            self.y = y
        }
}
extension DSShadowType: Codable {
    enum CodingKeys: CodingKey {
        case light, dark, radius, x, y
    }
    
    /// Creates a new instance by decoding from the given decoder.
    /// - Parameter decoder: The decoder to read data from.
    /// - Throws: An error if reading from the decoder fails, or if the data read is corrupted or otherwise invalid.
    /// - Returns: A new instance of this type decoded from the given decoder.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        radius = try container.decode(CGFloat.self, forKey: .radius)
        x = try container.decode(CGFloat.self, forKey: .x)
        y = try container.decode(CGFloat.self, forKey: .y)
        let lightHex = try container.decode(String.self, forKey: .light)
        let darkHex = try container.decode(String.self, forKey: .dark)
        light = SwiftUI.Color(hexValue: lightHex)
        dark = SwiftUI.Color(hexValue: darkHex)
    }
    
    /// Encodes this value into the given encoder.
    /// - Parameter encoder: The encoder to write data to.
    /// - Throws: An error if any values are invalid for the given encoder's format.
    /// - Returns: A new instance of this type encoded into the given encoder.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(radius, forKey: .radius)
        try container.encode(x, forKey: .x)
        try container.encode(y, forKey: .y)
        let lightHex = light.hexValue
        let darkHex = dark.hexValue
        try container.encode(lightHex, forKey: .light)
        try container.encode(darkHex, forKey: .dark)
    }
}
extension DSShadowType {
    static var mockSM: DSShadowType {
        DSShadowType(light: .black, dark: .white, radius: 4, x: 0, y: 2)
    }
    
    static var mockMD: DSShadowType {
        DSShadowType(light: .black, dark: .white, radius: 8, x: 0, y: 4)
    }
    
    static var mockLG: DSShadowType {
        DSShadowType(light: .black, dark: .white, radius: 16, x: 0, y: 8)
    }
}
