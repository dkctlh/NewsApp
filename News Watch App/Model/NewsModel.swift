//
//  NewsModel.swift
//  News Watch App
//
//  Created by Talha Dikici on 24.11.2022.
//

import Foundation
import SwiftUI

struct Initial:Hashable, Decodable{
    let status:String
    let totalResults: Int
    let articles:[News]
}
struct News: Hashable, Decodable {
    let author:String?
    let title:String
    let description:String?
    let urlToImage:String?
    let publishedAt:String?
    let content:String
}
class ViewModel:ObservableObject{
    @Published var newses: [News] = []
    func fetch(selectedCategory:String?){
        let categoryUrl: String
        switch selectedCategory {
        case "Apple":
             categoryUrl = "https://newsapi.org/v2/everything?q=apple&from=2022-11-22&to=2022-11-22&sortBy=popularity&apiKey=9a91bac3e51848c1b71c8eff1e58b4d2"
        case "Tesla":
             categoryUrl = "https://newsapi.org/v2/everything?q=tesla&from=2022-10-24&sortBy=publishedAt&apiKey=9a91bac3e51848c1b71c8eff1e58b4d2"
        case "Business":
             categoryUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9a91bac3e51848c1b71c8eff1e58b4d2"
        case "TechCrunch":
             categoryUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9a91bac3e51848c1b71c8eff1e58b4d2"
        case "Wall Street Journal":
             categoryUrl = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=9a91bac3e51848c1b71c8eff1e58b4d2"
        default:
             categoryUrl = "https://newsapi.org/v2/everything?q=apple&from=2022-11-22&to=2022-11-22&sortBy=popularity&apiKey=9a91bac3e51848c1b71c8eff1e58b4d2"
        }
        guard let url = URL(string: categoryUrl) else {return }
        let task = URLSession.shared.dataTask(with: url)  {[weak self] data, _, error in
            guard let data = data , error == nil else {return}
            print(data)
            do {
                let artic = try JSONDecoder().decode(Initial.self,from: data)
                print(artic)
                self?.newses = artic.articles
            }catch {
                print(error)
            }
        }
        task.resume()
    }
}
