import SwiftUI

struct MyView: View {
    let designSystem: DesignSystem
    
    var body: some View {
        SwiftUI.Text("Hi")
            .font(designSystem.font.preferencial(.body, weight: .medium))
            .foregroundStyle(designSystem.colors.primary.default.color())
    }
}

#Preview {
    MyView(designSystem: .init(fileName: "Token"))
}

public final class DesignSystem: ObservableObject {
    public let colors: DSColor
    public let spacer: DSSpacer
    public let shadow: DSShadow
    public let font: DSFont
    
    public init(colors: DSColor, spacer: DSSpacer, shadow: DSShadow, font: DSFont) {
        self.colors = colors
        self.spacer = spacer
        self.shadow = shadow
        self.font = font
    }
    
    init(fileName: String) {
        let url = Bundle.module.url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decodedDesignSystem = try! JSONDecoder().decode(DesignSystem.self, from: data)
        colors = decodedDesignSystem.colors
        spacer = decodedDesignSystem.spacer
        shadow = decodedDesignSystem.shadow
        font = decodedDesignSystem.font
    }
}
extension DesignSystem: Codable { }
public extension DesignSystem {
    /// A mock design system.
    static var mock: DesignSystem {
        DesignSystem(colors: DSColor.mock, spacer: DSSpacer.mock, shadow: DSShadow.mock, font: DSFont())
    }
}
