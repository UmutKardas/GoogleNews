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
    }
}

#Preview {
    HomeUIView()
}
