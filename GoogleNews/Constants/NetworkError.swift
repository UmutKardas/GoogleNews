//
//  NetworkError.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 26.12.2024.
//

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case unknown(Error)
}
