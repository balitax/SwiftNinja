//
//  DOTErrorCodes.swift
//  DOTextension
//
//  Created by Agus Cahyono on 25/06/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation

/***
 * Error Codes
 * ===========
 * 001 = Bad request, request must be json format
 * 002 = Data validation error
 * 003 = Wrong credential
 ***/
enum NinjaErrorErrorCode: String {
    case requestMustJson = "001"
    case dataValidationError = "002"
    case wrongCredential = "003"
}
