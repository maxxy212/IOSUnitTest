//
//  NetworkResponseModel.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation

struct NetworkResponseModel {
    var statusCode: Int
    var data: Any?
    var errorMessage: String?
    var errorTitle: String?
    
    init(statsuCode: Int) {
        self.statusCode = statsuCode
    }
    
    init(statusCode: Int, data: Any? = nil, errorMessage: String? = nil, errorTitle: String? = "Error") {
        self.statusCode = statusCode
        self.data = data
        self.errorMessage = errorMessage
        self.errorTitle = errorTitle
    }
    
    func isSuccess() -> Bool {
        return statusCode == 200 || statusCode == 201
    }
    
    func isFailed() -> Bool {
        return statusCode == 404
    }
    
    func isBadRequest() -> Bool {
        return statusCode == 400
    }
    
    func isAuthorizationError() -> Bool {
        return statusCode == 401 || statusCode == 403
    }
    
    func getNetworkErrorMessage() -> String {
        if isBadRequest() {
            return getBadRequestMessage(_data: data!)
        }else if isFailed() {
            return getValidationErrorMessage(_data: data!)
        }else if isAuthorizationError() {
            return "Unauthorized request"
        }else {
            return "Unknown Error" 
        }
    }
    
    private func getBadRequestMessage(_data : Any) -> String {
        var description = ""
        if let message = _data as? String {
            description = message
        }
        return description
    }
    
    private func getValidationErrorMessage(_data : Any) -> String {
        var description = ""
        if let message = _data as? String {
            description = message
        }
        return description
    }
}
