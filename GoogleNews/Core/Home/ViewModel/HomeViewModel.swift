//
//  HomeViewModel.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var error: String?

    private let service: NewsProtocol
    private var subscriptions = Set<AnyCancellable>()

    init(service: NewsProtocol) {
        self.service = service
        fetchNews()
    }

    private func fetchNews() {
        service.fetchNews().sink { [weak self] completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self?.error = error.localizedDescription
            }
        } receiveValue: { [weak self] news in
            self?.news = news
            print(news)
        }
        .store(in: &subscriptions)
    }
}
