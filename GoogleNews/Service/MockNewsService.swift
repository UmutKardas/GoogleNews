//
//  MockNewsService.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import Combine
import Foundation

final class MockNewsService: NewsProtocol {
    func fetchNews() -> AnyPublisher<[News], NetworkError> {
        guard let path = Bundle.main.path(forResource: "mockNews", ofType: "json") else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let news = try JSONDecoder().decode([News].self, from: data)
            return Just(news).setFailureType(to: NetworkError.self).eraseToAnyPublisher()
        }
        catch {
            return Fail(error: NetworkError.unknown(error)).eraseToAnyPublisher()
        }
    }
}
