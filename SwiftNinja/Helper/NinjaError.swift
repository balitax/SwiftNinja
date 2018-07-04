//
//  DOTError.swift
//  DOTextension
//
//  Created by Agus Cahyono on 25/06/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation

struct NinjaError: Codable {
    let statusCode: Int?
    let data: DataError?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case data
    }
}

struct DataError: Codable {
    let errors: Errors?
}

struct Errors: Codable {
    let code: String?
    let messages: [String]?
}
