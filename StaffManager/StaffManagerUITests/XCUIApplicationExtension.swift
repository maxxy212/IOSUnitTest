//
//  XCUIApplicationExtension.swift
//  StaffManagerUITests
//
//  Created by Maxwell Nwanna on 11/04/2022.
//

import Foundation
import XCTest

public extension XCUIApplication {
    var isDisplayingPersonalView: Bool {
        return otherElements["PersonDetailView"].exists
    }
}
