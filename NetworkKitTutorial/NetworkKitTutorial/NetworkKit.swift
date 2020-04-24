//
//  NetworkKit.swift
//  NetworkKitTutorial
//
//  Created by Michael Abadi Santoso on 1/27/20.
//  Copyright © 2020 Michael Abadi Santoso. All rights reserved.
//

import Foundation

public protocol NetworkBaseRequest {
    var endpoint: String { get }
    var params: [String: Any]? { get }
}

public typealias HttpCompletion = (_ result: Any?,_ error: Error?) -> Void

public enum HttpMethod {
    case get
    case post
}

public let mockResult = [
    ["id":"0", "name": "Michael", "job": "Programmer"],
    ["id":"1", "name": "Niramon", "job": "QA"]
]

/// Network class for sending any HTTP Request
public class NetworkKit {
    
    public init() {}
    
    /// Send an HTTP Request.
    /// - Parameters:
    ///   - request: The request object of detailed destination.
    ///   - type: type of the http request.
    ///   - completion: the result or error.
    public func sendRequest(_ request: NetworkBaseRequest, type: HttpMethod, completion: HttpCompletion) {
        completion(mockResult, nil)
    }
    
    /// Setup the network with proper token.
    /// - Parameter token: The token needed for authentification of the networking.
    public func setupAuthentification(withToken token: String) {
        // You can setup your token as header or whatever it is in here as well
    }
}
