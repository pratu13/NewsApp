//
//  SavedListView.swift
//  News
//
//  Created by Pratyush  on 5/25/21.
//

import SwiftUI

struct SavedListView: View {
    @EnvironmentObject var viewModel: ArticlesViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.savedArticles.indices) { index in
                    NavigationLink(destination: Text(viewModel.articles[index].title)) {
                        SavedListRowView(article: viewModel.articles[index])
                    }
                }
            }
            .navigationBarTitle(Text("Saved News"))
        }
    }
}

struct SavedListView_Previews: PreviewProvider {
    static var previews: some View {
        SavedListView()
            .environmentObject(ArticlesViewModel())
    }
}
