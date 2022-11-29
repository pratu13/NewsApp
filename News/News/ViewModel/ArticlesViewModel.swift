//
//  SwiftUIView.swift
//  News
//
//  Created by Pratyush  on 5/23/21.
//

import SwiftUI

protocol ArticlesViewModelable {
    var articles: [Article] { get }
    var seletedTag: News.Tag.type {get}
    var isLoadingArticles: Bool { get }
    var tags: [News.Tag] {get}
    var savedArticles: [Article] {get}
    func getAritcles(tag: News.Tag.type)
}

final class ArticlesViewModel: ObservableObject, ArticlesViewModelable {
    @Published var tags: [News.Tag] = News.tags
    @Published var articles: [Article] = []
    @Published var savedArticles: [Article] = []
    @Published var isLoadingArticles: Bool = false
    @Published var seletedTag: News.Tag.type = .everything("covid")

    @Published var showErrorScreen: Bool = false
    init() {
       getAritcles(tag: .everything("covid"))
    }
}

//MARK: - Support Functions
extension ArticlesViewModel {
    
    func getAritcles(tag: News.Tag.type) {
        self.isLoadingArticles = true
        var path: String = ""
        switch tag {
        case .headlines(let country):
            path = API.Path.top_headlines(country).completePath
        case .everything(let query):
            path = API.Path.everything(query).completePath
        case .sources(let source):
            path = API.Path.sources(source).completePath
        }
       
        API.shared.makeCall(path: path) { result in
            switch result {
            case .success(let art):
                DispatchQueue.main.async {
                    self.articles = art
                    self.showErrorScreen = false
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.showErrorScreen = true
                }
               
            }
        }
    }

    func resetTagsState() {
        tags.indices.forEach { index in
            tags[index].isSelected = false
        }
    }
    
    func saveArticle(article: Article) {
        savedArticles.append(article)
    }
}
