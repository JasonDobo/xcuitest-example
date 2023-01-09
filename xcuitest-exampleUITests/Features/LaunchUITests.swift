//
//  LaunchUITests.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import XCTest

class LaunchUITests: BaseUITests {
    
    func test_FirstTest() {
        navigation.homeScreenIsDisplayed()
    }
}
