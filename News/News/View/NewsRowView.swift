//
//  NewsRowView.swift
//  News
//
//  Created by Pratyush  on 5/24/21.
//

import SwiftUI

extension String {
    
    func loadImage() -> UIImage {
        guard let url = URL(string: self) else {
            return UIImage()
        }
        do {
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        return UIImage()
    }
}

struct NewsRowView: View {
    @EnvironmentObject var viewModel: ArticlesViewModel
    var article: Article
    @State var saveButtonTapped: Bool = false
    
    var body: some View {
        GroupBox() {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(article.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        if let description = article.description {
                            Text(description)
                                .lineLimit(3)
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                        }
                    }
                    Image(uiImage: getImageFromURL())
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))   
                }
                
                Divider()
                    .frame(height: 5)
                
                HStack {
                    Spacer()
                    Label("Save", systemImage: saveButtonTapped ? "bookmark.fill" : "bookmark")
                        .onTapGesture {
                           save()
                        }
                    Spacer()
                }
            }
        }
    }
    
    func getImageFromURL() -> UIImage {
        var image: UIImage = UIImage()
        let queue: DispatchQueue = DispatchQueue(label: "Image", qos: .background, attributes: .concurrent)
        queue.async {
            image = (article.urlToImage?.loadImage())!
        }
        DispatchQueue.global(qos: .background).async {
            
        }
        return UIImage(imageLiteralResourceName: "temp1")
    }
    
}

//MARK:- Private Helpers
private extension NewsRowView {
    
    func getIndex() -> Int {
        var indx: Int = 0
        viewModel.savedArticles.indices.forEach { index in
            if self.viewModel.savedArticles[index].title == article.title {
                indx = index
            }
        }
        return indx
    }
    
    func save(){
        if !saveButtonTapped {
            saveButtonTapped = true
            viewModel.saveArticle(article: article)
            print(viewModel.savedArticles)
        } else {
            saveButtonTapped = false
            viewModel.savedArticles.remove(at: getIndex())
        }
    }
    
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView(article: .init(source: .init(id: "", name: ""), author: "People", title: "Taylor Swift Wins the Global Icon Award", description: "On Tuesday, Taylor Swift took home the global icon award at the 2021 Brit Awards, as she becomes both the first woman and first non-English artist to take home the award. She's also the youngest person to win the coveted prize.", url: "https://people.com/music/taylor-swift-wins-global-icon-award-brits-2021/", urlToImage: "", publishedAt: "2021", content: ""))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
