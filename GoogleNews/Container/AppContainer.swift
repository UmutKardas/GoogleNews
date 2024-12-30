//
//  AppContainer.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import Swinject

final class AppContainer {
    static let shared = AppContainer()

    private let container: Container = .init()

    var networkManager: NetworkManagerProtocol {
        guard let networkManager = container.resolve(NetworkManagerProtocol.self) else {
            fatalError("NetworkManager could not be resolved")
        }
        return networkManager
    }

    var newsService: NewsProtocol {
        guard let newsService = container.resolve(NewsProtocol.self, name: DependencyName.realService.rawValue) else {
            fatalError("NewsService could not be resolved")
        }
        return newsService
    }

    var mockNewsService: NewsProtocol {
        guard let newsService = container.resolve(NewsProtocol.self, name: DependencyName.mockService.rawValue) else {
            fatalError("NewsService could not be resolved")
        }
        return newsService
    }

    private init() {
        registerDependencies()
    }

    private func registerDependencies() {
        container.register(NetworkManagerProtocol.self) { _ in NetworkManager(config: NetworkConfig(baseURL: "https://newsapi90.p.rapidapi.com/topic/")) }
        container.register(NewsProtocol.self, name: DependencyName.realService.rawValue) { _ in NewsService(network: self.networkManager) }
        container.register(NewsProtocol.self, name: DependencyName.mockService.rawValue) { _ in MockNewsService() }
    }
}
