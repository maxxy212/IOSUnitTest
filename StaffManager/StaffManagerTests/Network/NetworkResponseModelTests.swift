//
//  NetworkResponseModelTests.swift
//  StaffManagerTests
//
//  Created by Maxwell Nwanna on 12/04/2022.
//

import XCTest
import SwiftyJSON
@testable import StaffManager

class NetworkResponseModelTests: XCTestCase {
    
    var networkResponseModel: NetworkResponseModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        networkResponseModel = NetworkResponseModel(statusCode: 200, data: "JSON()", errorMessage: "error", errorTitle: "title")
    }

    func testSuccessReturns() {
        //
        let result = networkResponseModel.isSuccess()
        
        XCTAssertTrue(result)
    }
    
    func testIsFaliedReturnFalse() {
        let result = networkResponseModel.isFailed()
        
        XCTAssertFalse(result)
    }
    
    func testIsBadRequestReturnFalse() {
        let result = networkResponseModel.isBadRequest()
        
        XCTAssertFalse(result)
    }
    
    func testisAuthorizationError() {
        let result = networkResponseModel.isAuthorizationError()
        
        XCTAssertFalse(result)
    }
    
    func testGetNetworkErrorMessage() {
        let result = networkResponseModel.getNetworkErrorMessage()
        
        XCTAssertEqual(result, "Unknown Error")
        XCTAssertNotNil(result)
    }
}
