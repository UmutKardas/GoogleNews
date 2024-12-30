//
//  HomeUIView.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import SwiftUI

struct HomeUIView: View {
    @StateObject var viewModel: HomeViewModel = .init(service: AppContainer.shared.mockNewsService)

    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                CustomToolBarItem(title: nil, titleStyle: nil, image: Image(systemName: "magnifyingglass"), imageStyle: nil, action: nil)
            }

            ToolbarItem(placement: .principal) {
                CustomToolBarItem(title: nil, titleStyle: nil, image: Image("googleNewsLogo"), imageStyle: ImageStyle(frame: CGSize(width: 40, height: 40)), action: nil)
            }

            ToolbarItem(placement: .topBarTrailing) {
                CustomToolBarItem(title: nil, titleStyle: nil, image: Image(systemName: "person.circle.fill"), imageStyle: nil, action: nil)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeUIView()
    }
}
