//
//  TabView.swift
//  News
//
//  Created by Pratyush  on 5/25/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel =  ArticlesViewModel()
    var body: some View {
        TabView {
            ContentView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            
            SavedListView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
