//
//  APIEndpoints.swift
//  coinmarketcap
//
//  Created by Juan Miguel Marqués Morilla on 14/10/17.
//  Copyright © 2017 Juan Miguel Marqués Morilla. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://api.coinmarketcap.com"
    static let version = "/v1"
    
    static let baseImageUrl = "https://files.coinmarketcap.com/static/img/coins"
    static let smallImage = "/32x32/"
    static let bigImage = "/128x128/"
}

protocol APIEndpoint {
    var path: String { get }
    var url: String { get }
}

enum APIEndpoints {
    enum List: APIEndpoint {
        case listEndPoint
        public var path: String {
            switch self {
            case .listEndPoint:
                return "/ticker/?convert=EUR"
            }
        }
        public var url: String {
            switch self {
            case .listEndPoint:
                return "\(API.baseUrl)\(API.version)\(path)"
            }
        }
    }
}
