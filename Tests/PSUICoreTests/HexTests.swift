//
//  HexTests.swift
//  
//
//  Created by Tiago Ferreira on 02/05/2023.
//

import XCTest
import SwiftUI
@testable import PSUICore

#if os(iOS)
class HexTests: XCTestCase {
    func test_create_hex_color() {
        let black = UIColor("#000000")
        XCTAssertEqual(black.hexValue, UIColor.black.hexValue)

        let white = UIColor("#ffffff")
        XCTAssertEqual(white.hexValue, UIColor.white.hexValue)

        let blackColor = Color("#000000")
        XCTAssertEqual(blackColor.hexValue, UIColor.black.hexValue)

        let whiteColor = Color("#ffffff")
        XCTAssertEqual(whiteColor.hexValue, UIColor.white.hexValue)
    }
}
#endif
