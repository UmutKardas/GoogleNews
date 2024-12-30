//
//  NetworkManagerProtocol.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 26.12.2024.
//

import Alamofire
import Combine

protocol NetworkManagerProtocol {
    func send<T>(path: NetworkPath, method: NetworkMethod, type: T.Type, body: (any Encodable)?, paramater: Alamofire.Parameters?) -> AnyPublisher<T, NetworkError> where T: Decodable
}
