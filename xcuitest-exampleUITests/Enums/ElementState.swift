//
//  ElementState.swift
//  xcuitest-exampleUITests
//
//  Created by Jason Dobo on 11/07/2023.
//

import Foundation

enum ElementState: String {
    case enabled = "enabled == true"
    case notEnabled = "enabled == false"
    case exists = "exists == true"
    case notExists = "exists == false"
    case hittable = "hittable == true"
    case notHittable = "hittable == false"
    case selected = "selected == true"
    case notSelected = "selected == false"
    case keyboardFocus = "hasKeyboardFocus == true"
}
