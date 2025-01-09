//
//  XCUIElement+Extensions.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 11/07/2023.
//

import Foundation
import XCTest

extension XCUIElement {
    
    /**
     Wait for XCUIElement to match the expected state and return a Bool.
     - Parameter state: expected element state
     - Parameter timeout: time to wait for state to matched
     */
    @discardableResult
    func wait(for state: ElementState, timeout time: TimeInterval = .default, handler: ((XCUIElement) -> Void)? = nil) -> Bool {
        guard state != .exists else {
            return self.waitForExistence(timeout: time)
        }
        
        let myTestCase = XCTestCase()
        let myPredicate = NSPredicate(format: state.rawValue)
        let myExpectation = myTestCase.expectation(for: myPredicate, evaluatedWith: self, handler: nil)
        
        let result = XCTWaiter().wait(for: [myExpectation], timeout: time) == XCTWaiter.Result.completed
        if result {
            handler?(self)
        }
        
        return result
    }
    
    /**
     Wait for XCUIElement to have expected state and tap
     - Parameter state: expected element state
     - Parameter timeout: time to wait for state to matched
     */
    func tap(when state: ElementState = .exists, timeout time: TimeInterval = .default) {
        guard self.wait(for: state, timeout: time) else {
            XCTFail("Could not tap element as \(self.identifier) not found with \(state.rawValue)")
            return
        }
        
        self.tap()
    }
    
    /**
     Tap if XCUIElement has expected state
     - Parameter state: expected element state
     - Parameter timeout: time to wait for state to matched
     */
    func tap(if state: ElementState = .exists, timeout time: TimeInterval = .default) {
        if self.wait(for: state, timeout: time) {
            self.tap()
        }
    }
    
    /**
     Tap on a XCUIElement using XCUICoordinate is required
     */
    func forceTap() {
        if self.isHittable {
            self.tap()
        } else {
            let coordinates: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            coordinates.tap()
        }
    }
    
    /**
     Enters text into a field after tapping to get focus
     - Parameter value: text to replace the existing text
     */
    func type(text value: String) {
        self.tap(when: .exists)
        self.typeText(value)
    }
    
    /**
     Replaces text contained within a field by highlighting all the existing text by triple tapping on the field, pressing delete and typing the new text.
     - Parameter value: text to replace the existing text
     */
    func replace(text value: String) {
        self.tap(withNumberOfTaps: 3, numberOfTouches: 1)
        self.typeText(XCUIKeyboardKey.delete.rawValue)
        
        self.typeText(value)
    }
    
    /**
     Updates the text within a field by deleting the exsisting text and then typing the new text
     - Parameter value: text to replace the existing text
     */
    func update(text value: String) {
        self.clearText()
        self.type(text: value)
    }
    
    /**
     Clears the text within a field, by tapping on the right right of the field and deleting
     */
    private func clearText() {
        guard let value = self.value as? String else {
            return
        }
        
        let coordinates: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5))
        coordinates.tap()
    }
    
    func gentleSwipe(direction: Direction) {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = 0.25
        let pressDuration: TimeInterval = 0.05
        
        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment
        
        let centre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))
        
        switch direction {
        case .up:
            centre.press(forDuration: pressDuration, thenDragTo: aboveCentre)
        case .down:
            centre.press(forDuration: pressDuration, thenDragTo: belowCentre)
        case .left:
            centre.press(forDuration: pressDuration, thenDragTo: leftOfCentre)
        case .right:
            centre.press(forDuration: pressDuration, thenDragTo: rightOfCentre)
        }
    }
}
