//
//  HeadlineNewsCell.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 2.01.2025.
//

import Kingfisher
import SwiftUI

struct HeadlineNewsCell: View {
    var news: News?

    private let screenBounds: CGRect = UIScreen.main.bounds

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: news?.relatedArticles?.first?.image ?? ""))
                .resizable()
                .frame(height: screenBounds.height * 0.25)
                .cornerRadius(20)
                .clipped()

            KFImage(URL(string: news?.relatedArticles?.first?.pubLogo ?? ""))
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))

            Text("\(news?.relatedArticles?.first?.title ?? "")")
                .font(.title3)

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
    HeadlineNewsCell(news: nil)
}
