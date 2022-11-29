//
//  ArticlesModel.swift
//  News
//
//  Created by Pratyush  on 5/23/21.
//

import SwiftUI

struct APIResponses: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}


struct Source: Codable {
    let id: String?
    let name: String
}
