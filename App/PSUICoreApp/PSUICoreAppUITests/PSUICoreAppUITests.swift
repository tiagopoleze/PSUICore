//
//  PSUICoreAppUITests.swift
//  PSUICoreAppUITests
//
//  Created by Tiago Ferreira on 23/12/2023.
//

import XCTest

final class PSUICoreAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testMediaTypeAccessRequesterView() throws {
        let app = XCUIApplication()
        app.launch()
        app.resetAuthorizationStatus(for: .camera)
        // Verify that the view is displayed
        XCTAssertTrue(app.staticTexts["MediaTypeAccessRequesterView"].exists)

        // Perform steps to dismiss the view
        // ...

        // Verify that the view is dismissed
//        XCTAssertFalse(app.staticTexts["MediaTypeAccessRequesterView"].exists)
    }
}
