//
//  BaseScreen.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 13/12/2022.
//

import Foundation
import XCTest

class BaseScreen : XCTestCase {

    enum ElementState: String {
        case enabled = "enabled == true"
        case notenabled = "enabled == false"
        case exists = "exists == true"
        case notexists = "exists == false"
        case hittable = "hittable == true"
        case nothittable = "hittable == false"
        case selected = "selected == true"
        case notselected = "selected == false"
        case keyboardFocus = "hasKeyboardFocus == true"
        case count = "self.count >= "
    }
    
    @discardableResult
    func wait(for state: ElementState, with element: XCUIElement, waiting timeout: TimeInterval = 1.0) -> Bool {
        guard state != .exists else {
            return element.waitForExistence(timeout: timeout)
        }

        let myPredicate = NSPredicate(format: state.rawValue)
        let testcase = XCTestCase()
        let myExpectation = testcase.expectation(for: myPredicate, evaluatedWith: element, handler: nil)
        
        return XCTWaiter().wait(for: [myExpectation], timeout: timeout) ==  XCTWaiter.Result.completed
    }
    
    func waitAndTap(element: XCUIElement, waiting timeout: TimeInterval = 0.5) {
        wait(for: .exists, with: element, waiting: timeout)
        element.tap()
    }
    
    func enterText(text value: String, identifier id: String) {
        let element = XCUIApplication().textFields[id]
        waitAndTap(element: element, waiting: 0.2)
        
        element.typeText(value)
    }
    
    func updateText(identifier id: String, with value: String) {
        let element = XCUIApplication().textFields[id]
        waitAndTap(element: element, waiting: 0.2)
        element.clearField()
        element.typeText(value)
    }
    
    func clearText(identifier id: String) {
        let element = XCUIApplication().textFields[id]
        element.tap()
        element.clearField()
    }    
}
