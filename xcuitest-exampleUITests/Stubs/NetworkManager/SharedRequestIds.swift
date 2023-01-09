//
//  SharedRequestIds.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 09/01/2023.
//

import Foundation

class SharedRequestIds<K: Hashable, V> {
    var dict: [K: V] = Dictionary()
    
    subscript(key: K) -> V? {
        get {
            return dict[key]
        }
        set(newValue) {
            dict[key] = newValue
        }
    }
}
