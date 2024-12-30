//
//  NetworkManager.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 26.12.2024.
//

import Alamofire
import Combine
import Foundation

final class NetworkManager: NetworkManagerProtocol {
    private var config: NetworkConfig
    private var decoder: JSONDecoder

    init(config: NetworkConfig, decoder: JSONDecoder = JSONDecoder()) {
        self.config = config
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .iso8601
    }

    func send<T>(path: NetworkPath, method: NetworkMethod, type: T.Type, body: (any Encodable)?, paramater: Alamofire.Parameters?) -> AnyPublisher<T, NetworkError> where T: Decodable {
        let url = config.baseURL + path.rawValue
        var request: DataRequest

        if let body = body {
            request = AF.request(
                url,
                method: method.method,
                parameters: body, encoder: JSONParameterEncoder.default, headers: ApiHeader.defaultHeaders
            )
        } else {
            request = AF.request(
                url,
                method: method.method,
                parameters: paramater,
                headers: ApiHeader.defaultHeaders
            )
        }

        return Future { promise in
            request.validate()
                .responseDecodable(of: T.self, decoder: self.decoder) { response in
                    if let responseValue = response.value {
                        promise(.success(responseValue))
                    } else {
                        promise(.failure(NetworkError.invalidResponse))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}
