//
//  PSButtonSize.swift
//  
//
//  Created by Tiago Ferreira on 11/05/2023.
//

import SwiftUI

public enum PSButtonSize {
    case small
    case medium

    var font: Font {
        switch self {
        case .small:
            return Font.subheadline.weight(.semibold)
        case .medium:
            return Font.body.weight(.semibold)
        }
    }

    var controleSize: ControlSize {
        switch self {
        case .small:
            return .small
        case .medium:
            return .regular
        }
    }
}
