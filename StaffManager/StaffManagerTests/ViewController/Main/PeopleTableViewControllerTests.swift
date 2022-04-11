//
//  PeopleTableViewControllerTests.swift
//  StaffManagerTests
//
//  Created by Maxwell Nwanna on 11/04/2022.
//

import XCTest
@testable import StaffManager

class PeopleTableViewControllerTests: XCTestCase {

    var sut: PeopleTableViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PeopleTableViewController") as? PeopleTableViewController
        _ = sut.view
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testTableViewPresent() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(sut.tableView)
    }
    
    func testDataSourcePresent() throws {
        
        XCTAssertNotNil(sut.tableView.dataSource.self)
    }
    
    func testNumberOfSection() throws {
        let numberOfSections = sut.tableView.numberOfSections
        
        XCTAssertEqual(1, numberOfSections)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
