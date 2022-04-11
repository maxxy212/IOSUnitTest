//
//  UserViewModel.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation

struct UserViewModel {
    
    private var userService = UserService()
    let peopleData = Box([PeopleData]())
    let roomData = Box([RoomData]())
    let errorTitle = Box("")
    let errorMessage = Box("")
    
    func getPeople() {
        userService.getPeople { result in
            switch result.isSuccess() {
            case true:
                self.peopleData.value = result.data as! [PeopleData]
            default:
                self.errorTitle.value = result.errorTitle!
                self.errorMessage.value = result.errorMessage!
            }
        }
    }
    
    func getRooms() {
        userService.getRoom { result in
            switch result.isSuccess() {
            case true:
                self.roomData.value = result.data as! [RoomData]
            default:
                self.errorTitle.value = result.errorTitle!
                self.errorMessage.value = result.errorMessage!
            }
        }
    }
}
