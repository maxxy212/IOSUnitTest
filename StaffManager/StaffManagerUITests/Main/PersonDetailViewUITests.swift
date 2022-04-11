//
//  PersonDetailViewControllerTest.swift
//  StaffManagerUITests
//
//  Created by Maxwell Nwanna on 11/04/2022.
//

import XCTest

class PersonDetailViewUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs
        continueAfterFailure = false
        
        // In UI tests it's important to set the initial state - such as interface orientation
        app = XCUIApplication()
        app.launch()
        sleep(1)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        super.tearDown()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        let app = XCUIApplication()
//        let element = app.otherElements["PersonDetailView"].children(matching: .other).element
//        element.swipeRight()
//        element.swipeRight()
//        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Maggie Brekke"]/*[[".cells.staticTexts[\"Maggie Brekke\"]",".staticTexts[\"Maggie Brekke\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.images["imageView"]/*[[".otherElements[\"PersonDetailView\"].images[\"imageView\"]",".images[\"imageView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testAllViews() throws {

        XCTAssert(app.isDisplayingPersonalView)
        
        let nameLabel = app.staticTexts["label"]
        let element = app.otherElements["PersonDetailView"].children(matching: .other).element
        let jobTitleLabel = app.staticTexts["label"]
        let favColorLabel = app.staticTexts["label"]
        let imageView = app.images["imageView"]
        
        XCTAssertTrue(nameLabel.exists)
        XCTAssertTrue(element.exists)
        XCTAssertTrue(jobTitleLabel.exists)
        XCTAssertTrue(favColorLabel.exists)
        XCTAssertTrue(imageView.exists)
    }

    func testPerformanceExample() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

}
