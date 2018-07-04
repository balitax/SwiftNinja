//
//  DOTHttpStatusCodes.swift
//  DOTextension
//
//  Created by Agus Cahyono on 25/06/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation

/***
 * HTTP Status Codes
 * =================
 * 200 = Response success
 *
 * 201 = Resources is created successfully
 * 401 = Unauthorized access / invalid token
 *
 * 400 = Bad Request / invalid request format
 *
 * 422 = Unprocessable Entities / data validation error
 *
 * 500 = Internal server error
 ***/
enum NinjaHTTPStatusCode: Int {
    /// Success
    case responseSuccess = 200
    case resourceCreated = 201
    /// Failure
    case unauthorizedAccess = 401
    case badRequest = 400
    case unprocessableEntities = 422
    case internalServerError = 500
}
