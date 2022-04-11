//
//  URL.swift
//  Staff Manager
//
//  Created by Maxwell Nwanna on 08/04/2022.
//

import Foundation

enum URLs {
    static var baseUrl: String {
        #if DEV
        return "https://61e947967bc0550017bc61bf.mockapi.io/api/v1"
        #elseif STAGE
        return "https://61e947967bc0550017bc61bf.mockapi.io/api/v1"
        #elseif PROD
        return "https://61e947967bc0550017bc61bf.mockapi.io/api/v1"
        #endif
    }
    
    static let people = "\(baseUrl)/people"
    static let rooms = "\(baseUrl)/rooms"
}
