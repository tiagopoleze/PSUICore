import Foundation

/// A struct that represents the spacing values for the design system.
public struct DSSpacer {
    /// The xxs spacing value.
    public let xxs: CGFloat
    /// The xs spacing value.
    public let xs: CGFloat
    /// The sm spacing value.
    public let sm: CGFloat
    /// The md spacing value.
    public let md: CGFloat
    /// The lg spacing value.
    public let lg: CGFloat
    /// The xl spacing value.
    public let xl: CGFloat
    /// The xxl spacing value.
    public let xxl: CGFloat
    
    /// Initializes a DSSpacer with the specified spacing values.
    /// - Parameters:
    ///  - xxs: The xxs spacing value.
    /// - xs: The xs spacing value.
    /// - sm: The sm spacing value.
    /// - md: The md spacing value.
    /// - lg: The lg spacing value.
    /// - xl: The xl spacing value.
    /// - xxl: The xxl spacing value.
    public init(xxs: CGFloat, xs: CGFloat, sm: CGFloat, md: CGFloat, lg: CGFloat, xl: CGFloat, xxl: CGFloat) {
        self.xxs = xxs
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
        self.xl = xl
        self.xxl = xxl
    }
}

extension DSSpacer: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.xxs = try container.decode(CGFloat.self, forKey: .xxs)
        self.xs = try container.decode(CGFloat.self, forKey: .xs)
        self.sm = try container.decode(CGFloat.self, forKey: .sm)
        self.md = try container.decode(CGFloat.self, forKey: .md)
        self.lg = try container.decode(CGFloat.self, forKey: .lg)
        self.xl = try container.decode(CGFloat.self, forKey: .xl)
        self.xxl = try container.decode(CGFloat.self, forKey: .xxl)
    }
}

extension DSSpacer {
    static var mock: DSSpacer {
        DSSpacer(xxs: 1, xs: 2, sm: 4, md: 8, lg: 16, xl: 32, xxl: 64)
    }
}
