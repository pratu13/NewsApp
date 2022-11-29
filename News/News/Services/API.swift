//
//  API.swift
//  News
//
//  Created by Pratyush  on 5/23/21.
//

import SwiftUI

final class API {
    
    private init() {}
    static let shared = API()
    
    struct Base {
        static let url: String = "https://newsapi.org/v2/"
        static let apiKey: String = "f1a7590c57364021af9d83afe8dc05c3"
    }
    
    enum Path {
        case top_headlines(String)
        case everything(String)
        case sources(String)
        
        var completePath: String {
            switch self {
            case .top_headlines(let country):
                return ("\(Base.url)top-headlines?country=\(country)&apiKey=\(Base.apiKey)")
            case .everything(let query):
                return ("\(Base.url)everything?q=\(query)&apiKey=\(Base.apiKey)")
            case .sources(let source):
                return ("\(Base.url)sources?category=\(source)&apiKey=\(Base.apiKey)")
            }
        }
    }
    
    public func makeCall(path: String, completion: @escaping (Result<[Article], Error>) -> ()) {
        guard let url = URL(string: path) else { return }
        print(url.absoluteURL)
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponses.self, from: data)
                    print(result.articles)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
