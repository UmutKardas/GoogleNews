//
//  NewsProtocol.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import Combine

protocol NewsProtocol {
    func fetchNews() -> AnyPublisher<[News], NetworkError>
}
