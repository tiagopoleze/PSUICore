import Foundation

/// Represents the corner radius values used in the design system.
public struct DSCornerRadius {
    public let small: CGFloat
    public let medium: CGFloat
    public let large: CGFloat
    
    /// Initializes a new instance of `DSCornerRadius` with the specified corner radius values.
    /// - Parameters:
    ///   - small: The corner radius value for small corners.
    ///   - medium: The corner radius value for medium corners.
    ///   - large: The corner radius value for large corners.
    public init(small: CGFloat, medium: CGFloat, large: CGFloat) {
        self.small = small
        self.medium = medium
        self.large = large
    }
}

extension DSCornerRadius: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        small = try container.decode(CGFloat.self, forKey: .small)
        medium = try container.decode(CGFloat.self, forKey: .medium)
        large = try container.decode(CGFloat.self, forKey: .large)
    }
}

extension DSCornerRadius {
    /// A mock instance of `DSCornerRadius` for testing purposes.
    static var mock: DSCornerRadius {
        DSCornerRadius(small: 1, medium: 2, large: 4)
    }
}
