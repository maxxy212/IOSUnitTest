//
//  UserProtocol.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation

protocol UserProtocol {
    
    func getPeople(completionHandler: @escaping(NetworkResponseModel) -> Void)
    
    func getRoom(completionHandler: @escaping(NetworkResponseModel) -> Void)
}
