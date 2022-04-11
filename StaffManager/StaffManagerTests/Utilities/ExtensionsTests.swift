//
//  ExtensionsTests.swift
//  StaffManagerTests
//
//  Created by Maxwell Nwanna on 11/04/2022.
//

import XCTest
@testable import StaffManager

class ExtensionsTests: XCTestCase {

    func testconvertToDate() {
        // 1
        let expectation = self.expectation(
        description: "People data")
        
        //2
        let dateFormat = "2022-01-24T20:52:50.765Z"
        
        //3
        let result = dateFormat.convertToDate()
        
        //4
        if result != nil {
            expectation.fulfill()
        }
        
        //5
        waitForExpectations(timeout: 1, handler: nil)
    }

}
