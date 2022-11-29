//
//  NewsTagData.swift
//  News
//
//  Created by Pratyush  on 5/24/21.
//

import Foundation

struct News {
    
    struct Tag: Identifiable {
        var id = UUID()
        var name: String
        var country: String?
        var topic: String?
        var source: String?
        var isSelected: Bool
        var type: News.Tag.type
        
        enum type {
            case headlines(String)
            case everything(String)
            case sources(String)
        }
    }
    
    /// Primary Tags
    static var tags = [
        News.Tag(name: "Covid", isSelected: false, type: .everything("covid")),
        News.Tag(name: "World News", isSelected: false, type: .everything("world")),
        News.Tag(name: "India", isSelected: false, type: .headlines("in")),
        News.Tag(name: "USA", isSelected: false, type: .headlines("us")),
        News.Tag(name: "United Kingdom", isSelected: false, type: .headlines("uk")),
        News.Tag(name: "New Zealand", isSelected: false, type: .everything("nz")),
    ]
    
    static var countries: [String] = {
        ["ae","ar","at","au","be","bg","br","ca","ch","cn","co","cu","cz","de","eg","fr","gb","gr","hk","hu","id","ie","il","in","it","jp","kr","lt","lv","ma","mx","my","ng","nl","no","nz","ph","pl","pt","ro","rs","ru","sa","se","sg","si","sk","th","tr","tw","ua","us","ve","za"]
    }()
}



let sampleData: [Article] = [
    .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""),
    
    .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""),
    
    .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""),
    
    .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""),
    
    .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""),
    
    .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""),
    
    .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: "")
]
