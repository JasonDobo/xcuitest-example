//
//  HomeScreen.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import XCTest

class HomeScreen: BaseScreen {
    
    func isDisplayed() -> Bool {
        let one = XCUIApplication().staticTexts["Hello, world!"].exists
        let two = wait(for: .exists, with: XCUIApplication().staticTexts["HelloTest"])
        return one && two
    }
}
