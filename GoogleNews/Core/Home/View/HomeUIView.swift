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
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                // MARK: - Title
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Your briefing")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(viewModel.date.formatted(as: "EEEE, d MMMM"))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.leading, 5)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("55°F")
                            .font(.headline)
                        
                        Circle()
                            .foregroundStyle(.yellow)
                            .frame(width: 25, height: 25)
                    }
                    .padding(15)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.gray.opacity(0.5), lineWidth: 1)
                    }
                }
                
                // MARK: - Top Stories
                
                VStack {
                    Button {} label: {
                        Text("Top Stories")
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding(.top, 5)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.bottom, 15)
                    
                    HeadlineNewsCell(news: viewModel.news.first)
                }
                .padding(.top, 15)
                
                // MARK: - News

                ForEach(viewModel.news.dropFirst()) { news in
                    NewsCell(news: news)
                }
            }
            .padding(.horizontal, 20)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    CustomToolBarItem(title: nil, titleStyle: nil, image: Image(systemName: "magnifyingglass"), imageStyle: ImageStyle(frame: CGSize(width: 20, height: 20)), action: nil)
                }
                
                ToolbarItem(placement: .principal) {
                    CustomToolBarItem(title: nil, titleStyle: nil, image: Image("googleNewsLogo"), imageStyle: ImageStyle(frame: CGSize(width: 45, height: 45)), action: nil)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    CustomToolBarItem(title: nil, titleStyle: nil, image: Image(systemName: "person.circle.fill"), imageStyle: ImageStyle(frame: CGSize(width: 35, height: 35), foregroundColor: .blue), action: nil)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeUIView()
    }
}
