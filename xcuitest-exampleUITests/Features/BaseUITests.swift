//
//  BaseUITests.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import XCTest
import SBTUITestTunnelClient

class BaseUITests: XCTestCase {
    
    let navigation = NavigationSteps()

    let requestIds: SharedRequestIds<String, String> = SharedRequestIds.init()

    var serviceManager: ServiceManager!
    
    override func setUp() {
        serviceManager = ServiceManager(for: app, with: requestIds)
        serviceManager.getApiNames()
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app.terminate()
        XCTAssert(app.wait(for: .notRunning, timeout: 2))
    }
}
