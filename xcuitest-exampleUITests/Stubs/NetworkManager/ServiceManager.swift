//
//  ServiceManager.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import Foundation
import SBTUITestTunnelClient

class ServiceManager {
    
    let tunneledApp: SBTUITunneledApplication
    var requestIds: SharedRequestIds<String, String>
    
    init(for app: SBTUITunneledApplication, with ids: SharedRequestIds<String, String>) {
        tunneledApp = app
        requestIds = ids
    }
    
    let service = ServiceMock()
    
    // MARK: - Get /api
    func getApiNames(with underThirty: Bool = false) {
        if requestIds["getApiName"] != nil {
            tunneledApp.stubRequestsRemove(withId: requestIds["getApiName"]!)
        }
        
        if underThirty {
            requestIds["getApiName"] = tunneledApp.stubRequests(
                matching: service.getApiNamesRequestMatch(),
                response: service.getApiNamesUnderThirtyResponse())
        } else {
            requestIds["getApiName"] = tunneledApp.stubRequests(
                matching: service.getApiNamesRequestMatch(),
                response: service.getApiNamesResponse())
        }
    }
}
