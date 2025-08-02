//
//  XCUIElementQuery+Extentions.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 20/01/2024.
//

import Foundation
import XCTest

extension XCUIElementQuery {
    
    @discardableResult
    func waitFor(count: Int, timeout time: TimeInterval = .loading) -> Bool {
        let myPrediccate = NSPredicate(format: "self.count >= \(String(count))")
        let testcase = XCTestCase()
        
        let myExpectation = testcase.expectation(for: myPrediccate, evaluatedWith: self, handler: nil)
        return XCTWaiter().wait(for: [myExpectation], timeout: time) == XCTWaiter.Result.completed
    }
    
    @discardableResult
    func findElements(matching value: ElementMatch, for key: KeyPath = .label, timeout time: TimeInterval = .loading)-> XCUIElementQuery {
        let myPredicate = value.myPredicate(forKeyPatch: key.rawValue)
        let elementQuery = self.matching (myPredicate)
        
        XCTAssertTrue (elementQuery.waitFor(count: 1, timeout: time) , "No XCUIElements found for \(elementQuery.debugDescription)")
        return elementQuery
    }
    
    @discardableResult
    func findElement(matching value: ElementMatch, for key: KeyPath = .label, timeout time: TimeInterval = .loading) -> XCUIElement {
        return findElements(matching: value, for: key, timeout: time).firstMatch
    }
}
