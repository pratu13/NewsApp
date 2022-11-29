//
//  ContentView.swift
//  News
//
//  Created by Pratyush  on 5/23/21.
//

import SafariServices
import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: ArticlesViewModel
    @Environment(\.openURL) var openURL
    @State var isHeaderShown: Bool = true
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                let offset = reader.frame(in: .named("scroll")).origin.y
                ScrollView {
                    VStack {
                        if isHeaderShown {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10.0) {
                                    ForEach(viewModel.tags.indices, id: \.self) { index in
                                        NewsTagsView(tag: viewModel.tags[index])
                                            .onTapGesture {
                                                viewModel.resetTagsState()
                                                viewModel.tags[index].isSelected = true
                                                viewModel.getAritcles(tag: viewModel.tags[index].type)
                                            }
                                    }
                                }
                                .padding()
                            }
                        }
                        if !viewModel.showErrorScreen {
                            LazyVStack {
                                ForEach(viewModel.articles.indices, id: \.self) { index in
                                    NewsRowView(article: viewModel.articles[index])
                                        .frame(width: reader.size.width - 40)
                                        .padding(.top, 10)
                                        .onTapGesture {
                                            openURL(URL(string: viewModel.articles[index].url!)!)
                                        }
                                    
                                }
                            }
                           
                            .padding(.top, isHeaderShown ? CGFloat(0) : CGFloat(40))
                            .padding(.bottom)
                        } else {
                            VStack(spacing: 20.0){
                                Spacer()
                                Image(systemName: "wifi.exclamationmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.secondary)
                                Text("Opps, Something went wrong.Please try again")
                                    .foregroundColor(.secondary)
                                    .font(.caption2)
                                Spacer()
                            }
                            .offset(y: -80)
                            .frame(width: reader.size.width, height: reader.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .coordinateSpace(name: "scroll")
                .onChange(of: offset, perform: { value in
                    updateHeaderScroll(value: value)
                })
                .frame(width: reader.size.width, height: reader.size.height)
            }
            .navigationBarItems(
                trailing: NavigationLink(destination: AddTopicsView()) {
                    Image(systemName: "plus")
                }
            )
            .navigationBarTitle(Text("News - For You"), displayMode: .large)
            .edgesIgnoringSafeArea(.bottom)
        }
        .accentColor(.accentColor)
    }
    
    
}

//MARK:- Private Helpers

extension ContentView {
    func updateHeaderScroll(value: CGFloat) {
        if value <= 97.0 {
            withAnimation {
                isHeaderShown = false
            }
        } else {
            withAnimation {
                isHeaderShown = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ArticlesViewModel())
        
        
    }
}
