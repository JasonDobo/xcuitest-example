//
//  JSONFetchForMock.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import Foundation

class JSONFetchForMock {
    static func readJSONFromFile(fileName: String) -> [String: Any]? {
        var json: Any?
        guard let path = Bundle(for: JSONFetchForMock.self).path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        do {
            let fileUrl = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        } catch let error {
            print("JSON fetch error \(error)")
        }
        
        return json as? [String: Any]
    }
    
    static func readArrayJSONFromFile(fileName: String) -> [[String: Any]]? {
        var json: Any?
        guard let path = Bundle(for: JSONFetchForMock.self).path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        do {
            let fileUrl = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            json = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
        } catch let error {
            print("JSON fetch error \(error)")
        }
        
        return json as? [[String: Any]]
    }
}
