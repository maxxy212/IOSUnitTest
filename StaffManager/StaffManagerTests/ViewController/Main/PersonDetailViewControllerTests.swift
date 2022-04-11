//
//  PersonDetailViewControllerTests.swift
//  StaffManagerTests
//
//  Created by Maxwell Nwanna on 11/04/2022.
//

import XCTest
@testable import StaffManager

class PersonDetailViewControllerTests: XCTestCase {
    
    var sut: PersonDetailViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PersonDetailViewController") as? PersonDetailViewController
        _ = sut.view
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testAllViewsPresent() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let name: UILabel = sut.name
        XCTAssertNotNil(name, "No property called name")
        
        let email: UILabel = sut.email
        XCTAssertNotNil(email, "No property called email")
        
        let jobTitle: UILabel = sut.name
        XCTAssertNotNil(jobTitle, "No property called job title")
        
        let favColor: UILabel = sut.name
        XCTAssertNotNil(favColor, "No property called favColor")
        
        let imageView: UIImageView = sut.imageView
        XCTAssertNotNil(imageView, "No property called imageView")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
