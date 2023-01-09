//
//  ServiceMock.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import Foundation
import SBTUITestTunnelClient

class ServiceMock {
    
    private let serviceUrl = "cybertek-ui-names.herokuapp.com"
    
    func getApiNamesRequestMatch() -> SBTRequestMatch {
        return SBTRequestMatch(url: getApiNameUrl(), method: "GET")
    }

    func getApiNamesResponse() -> SBTStubResponse {
        return SBTStubResponse(response: getApiNameJSON(), returnCode: 200)
    }
    
    func getApiNamesUnderThirtyResponse() -> SBTStubResponse {
        return SBTStubResponse(response: getApiNameAgeJSON(), returnCode: 200)
    }
    
    fileprivate func getApiNameUrl() -> String {
        return "https://\(serviceUrl)/api*"
    }
    
    fileprivate func getApiNameJSON() -> [String: Any] {
        let file1 = JSONFetchForMock.readJSONFromFile(fileName: "TestJsonFile")!
        let file2 = JSONFetchForMock.readArrayJSONFromFile(fileName: "TestJsonArrayFile")!
        return file1
    }
    
    fileprivate func getApiNameAgeJSON() -> [String: Any] {
        var jsonObject = JSONFetchForMock.readJSONFromFile(fileName: "TestJsonFile")!
        var dataObject = jsonObject["data"] as! [[String: Any]]
        dataObject[0].updateValue(23, forKey: "age")
        
        jsonObject["data"] = dataObject
        return jsonObject
    }
}
