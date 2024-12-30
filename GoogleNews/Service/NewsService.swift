//
//  NewsService.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import Combine

final class NewsService: NewsProtocol {
    private let network: NetworkManagerProtocol

    init(network: NetworkManagerProtocol) {
        self.network = network
    }

    func fetchNews() -> AnyPublisher<News, NetworkError> {
        return network.send(path: .getLatestNews, method: .GET, type: News.self, body: nil, paramater: nil)
    }
}
