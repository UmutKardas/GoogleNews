//
//  News.swift
//  GoogleNews
//
//  Created by Hüseyin Umut Kardaş on 30.12.2024.
//

import Foundation

struct News: Identifiable, Decodable {
    let id: Int?
    let author: String?
    let authorTopicId: String?
    let date: TimeInterval?
    let domain: String?
    let image: String?
    let isVideo: Bool?
    let link: String?
    let preview: String?
    let pubLogo: String?
    let pubLogoLarge: String?
    let publisher: String?
    let relatedArticles: [RelatedArticle]?
    let title: String?
    let topicId: String?
}

struct RelatedArticle: Identifiable, Decodable {
    let id: Int?
    let author: String?
    let authorTopicId: String?
    let date: TimeInterval?
    let domain: String?
    let image: String?
    let isVideo: Bool?
    let link: String?
    let preview: String?
    let pubLogo: String?
    let pubLogoLarge: String?
    let publisher: String?
    let title: String?
    let topicId: String?
}
