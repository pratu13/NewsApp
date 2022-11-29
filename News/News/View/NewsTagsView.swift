//
//  HeaderTagView.swift
//  News
//
//  Created by Pratyush  on 5/24/21.
//

import SwiftUI

struct NewsTagsView: View {
    var tag: News.Tag
    
    var body: some View {
        Text(tag.name)
            .foregroundColor(tag.isSelected ? Color.white: Color.primary)
            .fontWeight(.bold)
            .padding()
            .background(tag.isSelected ? Color.red : .clear)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(Color.red, lineWidth: 1.0)
            )
            
    }
}

struct HeaderTagView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTagsView(tag: .init(name: "Covid", isSelected: false, type: .everything("covid")))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
