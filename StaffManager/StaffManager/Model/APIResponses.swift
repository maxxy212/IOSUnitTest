//
//  APIResponses.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation

struct PeopleData: Codable, Identifiable, Equatable {
    var createdAt: String?
    var firstName: String?
    var avatar: String?
    var lastName: String?
    var email: String?
    var jobtitle: String?
    var favouriteColor: String?
    var id: String?
    
    static let `default` = PeopleData()
}

struct RoomData: Codable, Identifiable, Equatable {
    var createdAt: String?
    var isOccupied: Bool?
    var maxOccupancy: Int?
    var id: String?
    
    static let `default` = RoomData()
}
