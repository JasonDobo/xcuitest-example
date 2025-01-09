//
//  TimeInterval+Extensions.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 11/07/2023.
//

import Foundation

extension TimeInterval {

    static var `default`: TimeInterval {
        2.0
    }

    static var slower: TimeInterval {
        5.0
    }

    static var loading: TimeInterval {
        10.0
    }
}
