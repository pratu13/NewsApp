//
//  AddTopicsView.swift
//  News
//
//  Created by Pratyush  on 5/24/21.
//

import SwiftUI

struct AddTopicsView: View {
    @EnvironmentObject var viewModel: ArticlesViewModel
    
    @State private var gridLayout = [
        GridItem(.flexible()),
    ]
    
    @State private var gridRow: Int = 3
    
    var body: some View {
        GeometryReader { reader in
            LazyVGrid(columns: gridLayout, alignment: .center) {
                ForEach(viewModel.tags.indices, id: \.self) { index in
                    NewsTagsView(tag: viewModel.tags[index])
                        .onTapGesture {
                            viewModel.tags[index].isSelected.toggle()
                        }
                }
            }
        }
        .padding()
        .padding(.top)
        .onAppear(perform: calucateRows)
    }
    
    func calucateRows() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridRow))
    }
}

struct AddTopicsView_Previews: PreviewProvider {
    static var previews: some View {
        AddTopicsView()
            .environmentObject(ArticlesViewModel())
    }
}
