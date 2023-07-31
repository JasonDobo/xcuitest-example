//
//  TimeInterval+Extensions.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 11/07/2023.
//

import Foundation

extension TimeInterval {

    static var `default`: TimeInterval {
        1.0
    }

    static var defaultSlower: TimeInterval {
        2.0
    }

    static var loading: TimeInterval {
        10.0
    }

    static var quick: TimeInterval {
        0.2
    }
}
