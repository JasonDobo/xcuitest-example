//
//  HomeScreen.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import XCTest

class HomeScreen: BaseScreen {

    let value = "Hello, world!"
    let id = "HelloTest"
    
    func isScreenDisplayed() -> Bool {
        let one = XCUIApplication().staticTexts[value].exists
        let two = wait(for: .exists, with: XCUIApplication().staticTexts[id])
        return one && two
    }

    func isDisplayed() -> Self {
        XCTAssertTrue(isScreenDisplayed())
        return self
    }
}
