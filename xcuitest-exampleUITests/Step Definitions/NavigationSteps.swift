//
//  NavigationSteps.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import XCTest

class NavigationSteps {
    
    func homeScreenIsDisplayed() {
        XCTAssertTrue(HomeScreen().isDisplayed())
    }
    
}
