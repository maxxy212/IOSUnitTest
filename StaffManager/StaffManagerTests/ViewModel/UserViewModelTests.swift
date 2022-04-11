//
//  UserViewModelTests.swift
//  StaffManagerTests
//
//  Created by Maxwell Nwanna on 11/04/2022.
//

import XCTest
@testable import StaffManager

class UserViewModelTests: XCTestCase {
    
    func testGetPeople() {
        // 1
        let expectation = self.expectation(
        description: "People data")

        // 2
        let viewModel = UserViewModel()

        // 3
        viewModel.peopleData.bind { result in
            if result == [PeopleData]() {
                expectation.fulfill()
            }
        }
        
        // 4
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.getPeople()
        }
        // 5
        waitForExpectations(timeout: 8, handler: nil)
    }
    
    func testGetRoom() {
        // 1
        let expectation = self.expectation(description: "Room data")
        
        //2
        let viewModel = UserViewModel()
        
        //3
        viewModel.roomData.bind { result in
            if result == [RoomData]() {
                expectation.fulfill()
            }
        }
        
        //4
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.getRooms()
        }
        
        // 5
        waitForExpectations(timeout: 8, handler: nil)
    }


}
