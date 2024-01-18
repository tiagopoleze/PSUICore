import SwiftUI

/// The DesignSystem class represents a collection of design-related properties and configurations.
public final class DesignSystem: ObservableObject {
    public let colors: DSColor
    public let spacer: DSSpacer
    public let shadow: DSShadow
    public let cornerRadius: DSCornerRadius
    public let font: DSFont
    
    /// Initializes a new instance of the DesignSystem class.
    /// - Parameters:
    ///   - colors: The color configuration for the design system.
    ///   - spacer: The spacing configuration for the design system.
    ///   - shadow: The shadow configuration for the design system.
    ///   - cornerRadius: The corner radius configuration for the design system.
    ///   - font: The font configuration for the design system.
    public init(colors: DSColor,
                spacer: DSSpacer,
                shadow: DSShadow,
                cornerRadius: DSCornerRadius,
                font: DSFont) {
        self.colors = colors
        self.spacer = spacer
        self.shadow = shadow
        self.cornerRadius = cornerRadius
        self.font = font
    }
    
    /// Initializes a new instance of the DesignSystem class by decoding a JSON file.
    /// - Parameter fileName: The name of the JSON file to decode.
    /// - Throws: An error of type DesignSystemError if the decoding process fails.
    init(fileName: String) throws {
        let url = Bundle.module.url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        guard let decodedDesignSystem = try? JSONDecoder().decode(DesignSystem.self, from: data) else {
            throw DesignSystemError.decodable
        }
        colors = decodedDesignSystem.colors
        spacer = decodedDesignSystem.spacer
        shadow = decodedDesignSystem.shadow
        cornerRadius = decodedDesignSystem.cornerRadius
        font = decodedDesignSystem.font
    }
}

extension DesignSystem: Codable { }

public extension DesignSystem {
    /// A mock design system for testing purposes.
    static var mock: DesignSystem {
        DesignSystem(colors: DSColor.mock, spacer: DSSpacer.mock, shadow: DSShadow.mock, cornerRadius: DSCornerRadius.mock, font: DSFont())
    }
}

public enum DesignSystemError: Error {
    case decodable
}
