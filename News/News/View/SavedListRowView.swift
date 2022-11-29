//
//  SavedListRowView.swift
//  News
//
//  Created by Pratyush  on 5/25/21.
//

import SwiftUI

struct SavedListRowView: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .foregroundColor(.primary)
                .lineLimit(2)
                .font(.title2)
            Text(article.description ?? "")
                .lineLimit(2)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct SavedListRowView_Previews: PreviewProvider {
    static var previews: some View {
        SavedListRowView(article: .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""))
        
    }
}
