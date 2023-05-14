//
//  File.swift
//  
//
//  Created by Tiago Ferreira on 14/05/2023.
//

import SwiftUI

public extension Color {
    static func primaryPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color("#247BA0")
            : Color("#264653")
    }
    static func secondaryPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color("#FFE066")
            : Color("#E9C46A")
    }
    static func tertiaryPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color("#50514F")
            : Color("#F4A261")
    }
    static func successPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color("#70C1B3")
            : Color("#2A9D8F")
    }
    static func dangerPS(_ colorScheme: ColorScheme) -> Color {
        colorScheme == .light
            ? Color("#F25F5C")
            : Color("#E76F51")
    }
}
