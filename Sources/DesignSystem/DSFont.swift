import SwiftUI

public struct DSFont: Codable {
    public init() { }
    
    func preferencial(_ textStyle: SwiftUI.Font.TextStyle,
                      weight: SwiftUI.Font.Weight,
                      design: SwiftUI.Font.Design = .default,
                      leading: SwiftUI.Font.Leading = .standard,
                      width: SwiftUI.Font.Width = .standard) -> SwiftUI.Font {
        SwiftUI.Font
            .system(textStyle, design: design, weight: weight)
            .leading(leading)
            .width(width)
    }
}
