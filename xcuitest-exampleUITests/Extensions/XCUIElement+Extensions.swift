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
     Wait for element to match the expected state state and return a Bool.
     - Parameter state: expected element state
     - Parameter time: time to wait for state to matched
     */
    @discardableResult
    func wait(for state: ElementState, waiting time: TimeInterval = .defaultSlower) -> Bool {
        guard state != .exists else {
            return self.waitForExistence(timeout: time)
        }

        let myPredicate = NSPredicate(format: state.rawValue)
        let testcase = XCTestCase()
        let myExpectation = testcase.expectation(for: myPredicate, evaluatedWith: self, handler: nil)

        return XCTWaiter().wait(for: [myExpectation], timeout: time) == XCTWaiter.Result.completed
    }

    /**
     Wait for element to exist and then tap on the element.
     - Parameter time: time to wait for element to exist
     */
    func waitAndTap(with state: ElementState = .exists, waiting time: TimeInterval = .default) {
        self.wait(for: state, waiting: time)
        self.tap()
    }

    /**
     Wait for element to exist and then tap on the element.
     - Parameter time: time to wait for element to exist
     */
    func waitAndTapIfExists(waiting time: TimeInterval = .default) {
        if waitForExistence(timeout: time) {
            self.tap()
        }
    }

    /**
     Paste text into a field by selecting all and then pasting the new text into the field.
     - Parameter value: text to be pasted into the field
     */
    func paste(text value: String) {
        UIPasteboard.general.string = value
        self.waitAndTap()
        _ = self.waitForExistence(timeout: 0.2)

        self.press(forDuration: 1.3)
        XCUIApplication().menuItems.firstMatch.tap()
    }

    /**
     Replaces text contained within a field by highlighting the existing text, pressing delete and typing the new text.
     - Parameter value: text to replace the existing text
     */
    func replace(text value: String) {
        self.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        self.typeText(XCUIKeyboardKey.delete.rawValue)

        self.typeText(value)
    }

    /**
     Updates the text within a field by deleting each character and then typing in the new value.
     - Parameter value: text to be typed into the field
     */
    func update(text value: String) {
        self.clearText()
        self.typeText(value)
    }

    /**
     Type text into a field after taping on the field to cause element to have keybaord focus. Will not work if field has text
     - Parameter value: text to be typed into the field
     */
    func enter(text value: String) {
        self.waitAndTap()
        self.typeText(value)
    }

    /**
     Delete the text contained within the field after tapping on the field
     */
    func clearField() {
        self.tap()
        self.clearText()
    }

    private func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }

        self.coordinate(withNormalizedOffset: CGVector(dx: 0.9, dy: 0.5)).tap()
        self.typeText(String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        )
    }

    /**
     Taps on an element regardless of if the element is hittable
     */
    func forceTap() {
        if self.isHittable {
            self.tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            coordinate.tap()
        }
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
