//
//  NetworkMethod.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 26.12.2024.
//

import Alamofire

enum NetworkMethod {
    case GET
    case POST
    case PUT

    var method: HTTPMethod {
        switch self {
        case .GET: return .get
        case .POST: return .post
        case .PUT: return .put
        }
    }
}
