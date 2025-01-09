//
//  ElementMatch.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 20/01/2024.
//

import Foundation

enum ElementMatch {
    case contains (String)
    case beginsWith(String)
    case endsWith (String)
    case regex (String)

    func myPredicate (forKeyPatch keyPath: String = "label") -> NSPredicate {
        switch self {
        case .contains(let label):
            return NSPredicate(format: "\(keyPath) CONTAINS[c] %@", label)
        case .beginsWith(let label):
            return NSPredicate(format: "\(keyPath) BEGINSWITH[c] %@", label)
        case .endsWith(let label):
            return NSPredicate(format: "\(keyPath) ENDSWITH[c] %@", label)
        case .regex(let label):
            return NSPredicate(format: "\(keyPath) MATCHES[c] %@", label)
        }
    }
}
