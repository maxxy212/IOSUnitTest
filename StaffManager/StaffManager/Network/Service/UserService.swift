//
//  UserService.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation
import Alamofire
import SwiftyJSON

struct UserService: UserProtocol {
    
    func getPeople(completionHandler: @escaping (NetworkResponseModel) -> Void) {
        DispatchQueue.global(qos: .background).async {
            AF.request(URLs.people, method: .get)
                .responseData { response in
                    let networkResponse = NetworkResponseModel(statsuCode: response.response?.statusCode ?? 0)
                    switch response.result {
                    case .success(let value):
                        if networkResponse.isSuccess() {
                            do{
                                let json = try JSON(data: value)
                                let people = try! JSONDecoder().decode([PeopleData].self, from: json.rawData())
                                completionHandler(NetworkResponseModel(statusCode: networkResponse.statusCode, data: people))
                            }catch {
                                completionHandler(NetworkResponseModel(statusCode: 0, data: nil, errorMessage: error.localizedDescription))
                            }
                        }else {
                            completionHandler(NetworkResponseModel(statusCode: networkResponse.statusCode, data: value, errorMessage: networkResponse.getNetworkErrorMessage()))
                        }
                    case .failure(let err):
                        completionHandler(NetworkResponseModel(statusCode: networkResponse.statusCode, data: nil, errorMessage: err.localizedDescription))
                    }
                }
        }
    }
    
    func getRoom(completionHandler: @escaping (NetworkResponseModel) -> Void) {
        DispatchQueue.global(qos: .background).async {
            AF.request(URLs.rooms, method: .get)
                .responseData { response in
                    let networkResponse = NetworkResponseModel(statsuCode: response.response?.statusCode ?? 0)
                    switch response.result {
                    case .success(let value):
                        if networkResponse.isSuccess() {
                            do{
                                let json = try JSON(data: value)
                                let room = try! JSONDecoder().decode([RoomData].self, from: json.rawData())
                                completionHandler(NetworkResponseModel(statusCode: networkResponse.statusCode, data: room))
                            }catch {
                                completionHandler(NetworkResponseModel(statusCode: 0, data: nil, errorMessage: error.localizedDescription))
                            }
                        }else {
                            completionHandler(NetworkResponseModel(statusCode: networkResponse.statusCode, data: value, errorMessage: networkResponse.getNetworkErrorMessage()))
                        }
                    case .failure(let err):
                        completionHandler(NetworkResponseModel(statusCode: networkResponse.statusCode, data: nil, errorMessage: err.localizedDescription))
                    }
                }
        }
    }
    
    
}
