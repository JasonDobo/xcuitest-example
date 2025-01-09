//
//  XCUIElementArray+Extensions.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 20/01/2024.
//

import Foundation
import XCTest

extension Array where Element: XCUIElement {
    
    @discardableResult
    func waitForAllElements(with state: ElementState, timeout: TimeInterval = .loading) -> Bool {
        let myPredicate = NSPredicate(format: state .rawValue)
        var allExpectations: [XCTNSPredicateExpectation]!
        
        allExpectations = self.map { element -> XCTNSPredicateExpectation in
            return XCTNSPredicateExpectation(predicate: myPredicate, object: element)
        }
        
        let result = XCTWaiter().wait(for: allExpectations, timeout: timeout, enforceOrder: false)
        return result == XCTWaiter.Result.completed
    }
    
    @discardableResult
    func findFirstMatch(with state: ElementState, timeout: TimeInterval = .loading, handle: ((XCUIElement) -> Void)? = nil) -> XCUIElement? {
        let myPredicate = NSPredicate(format: state .rawValue)
        var allExpectations: [XCTNSPredicateExpectation]!
        var matchedElement: XCUIElement?
        
        allExpectations = self.map { element -> XCTNSPredicateExpectation in
            let myHandler: () -> Bool = {
                if matchedElement != nil {
                    return true
                }
                
                matchedElement = element
                allExpectations.forEach {
                    $0.fulfill()
                }
                
                return true
            }
            
            let myXCTNSPredicateExpectation = XCTNSPredicateExpectation(predicate: myPredicate, object: element)
            myXCTNSPredicateExpectation.handler = myHandler
            return myXCTNSPredicateExpectation
        }
        
        XCTWaiter().wait(for: allExpectations, timeout: timeout)
        if let matched = matchedElement {
            handle?(matched)
        }
        
        return matchedElement
    }
}
