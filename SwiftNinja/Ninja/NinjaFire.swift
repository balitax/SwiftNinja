//
//  DOTFire.swift
//  DOTextension
//
//  Created by Agus Cahyono on 25/06/18.
//  Copyright © 2018 DOT Indonesia 2018. All rights reserved.
//

import Foundation
import Alamofire

open class NinjaFire {
    
    public static let shared = NinjaFire()
    var manager: SessionManager!
    
    /// MARK: Global HTTP Request
    ///
    /// - Parameters:
    ///   - url: url of API
    ///   - method: method of http request (support for .post, .get, .delete)
    ///   - parameters: parameters of request (parameters is [String: Any])
    ///   - headers: header for request (headers is [String: Any])
    ///   - onsuccess: on success completion
    ///   - onfailure: on failure completion
    func request(_ url: String, method: HTTPMethod, parameters: Parameters = Parameters(), encoding: ParameterEncoding, headers: HTTPHeaders = HTTPHeaders(), completion: @escaping(_ response: Data) -> (), failure: @escaping(_ error: NinjaError)-> ()) {
        
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        manager = Alamofire.SessionManager(configuration: configuration)
        
        manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseString(queue: DispatchQueue.main, encoding: String.Encoding.utf8) { responseData in
            
            //-------------------------------------------------
            let statusData = responseData.response?.statusCode ?? 0
            
            if statusData == NinjaHTTPStatusCode.responseSuccess.rawValue {
                if let response = responseData.data {
                    completion(response)
                    debugPrint("DEBUG: -- \(response) --")
                }
            } else {
                // ---------------------------------------------
                if let errorData = responseData.data {
                    
                    let decoder = JSONDecoder()
                    guard let errorCallback = try? decoder.decode(NinjaError.self, from: errorData) else {
                        failure(self.defaultErrorMessage())
                        return
                    }
                    failure(errorCallback)
                } else {
                    failure(self.defaultErrorMessage())
                }
            }
        }
    }
    
    
    /// MARK: Global Http Upload
    ///
    /// - Parameters:
    ///   - url: URL Of API
    ///   - anyImage: any image upload as parameters
    ///   - anyParameters: any string as parameters
    ///   - headers: headers
    ///   - completion: completion success
    ///   - failure: failure success
    func upload(_ url: String, anyImage: [UIImage], anyParameters: [String: String], headers: HTTPHeaders, completion: @escaping(_ data: Data) -> (), failure: @escaping(_ error: NinjaError) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        manager = Alamofire.SessionManager(configuration: configuration)
        
        manager.upload(multipartFormData: { (multipartFormData) in
            
            // add image parameters to multipart data
            if !anyImage.isEmpty {
                for image in anyImage {
                    let imageData = UIImageJPEGRepresentation(image, 0.4)
                    if let imageDataOptional = imageData {
                        multipartFormData.append(imageDataOptional, withName: "image")
                    }
                }
            }
            
            // add string parameters to multipart data
            if !anyParameters.isEmpty {
                for params in anyParameters {
                    multipartFormData.append(params.key.data(using: String.Encoding.utf8)!, withName: params.value)
                }
            }
            
        },
        usingThreshold: UInt64.init(),
        to: url,
        method: .post,
        headers: headers) { result in
            
        switch result {
            case .success(let upload, _, _):
                upload.responseString(queue: DispatchQueue.main, encoding: String.Encoding.utf8) { response in
                    
                    // Response Success
                    if response.response?.statusCode == 200 {
                        if let dataResponse = response.data {
                            completion(dataResponse)
                        }
                    } else {
                        // Response Eerror
                        failure(self.defaultErrorMessage())
                    }
                    
                }
            case .failure(_):
                // Response Global Success
                failure(self.defaultErrorMessage())
            }
        }
        
    }
    
    
    /// MARK: Mapping Encode Data
    ///
    /// - Parameters:
    ///   - data: data
    ///   - responseData: response data
    func mappingDecode(_ data: Any, responseData: Data) {
//        let decoder = JSONDecoder()
//        guard let callback = try? decoder.decode(data.self, from: responseData) else {
//            return
//        }
    }
    
    /// MARK: Default error message
    ///
    /// - Returns: bring the default error global
    func defaultErrorMessage() -> NinjaError {
        let error = Errors(code: "00", messages: ["There is unknow error. Please try again"])
        let dataError = DataError(errors: error)
        let errorReturn = NinjaError(statusCode: 1, data: dataError)
        return errorReturn
    }
    
}
