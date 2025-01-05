//
//  NewsCell.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 2.01.2025.
//

import Kingfisher
import SwiftUI

struct NewsCell: View {
    var news: News?

    private let screenBounds: CGRect = UIScreen.main.bounds

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    KFImage(URL(string: news?.relatedArticles?.first?.pubLogo ?? ""))
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))

                    Text("\(news?.relatedArticles?.first?.title ?? "")")
                        .font(.system(size: 18, weight: .medium))
                }
                Spacer()

                KFImage(URL(string: news?.relatedArticles?.first?.image ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenBounds.width * 0.2, height: screenBounds.width * 0.2)
                    .cornerRadius(20)
                    .clipped()
            }

            HStack {
                Text("\(news?.relatedArticles?.first?.date.map { Date(timeIntervalSince1970: $0).timeAgo() } ?? "")")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                Spacer()

                Image("newsIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)

                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
            }

            Divider()
        }
    }
}

#Preview {
    NewsCell(news: nil)
}
