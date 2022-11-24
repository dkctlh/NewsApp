//
//  ContentView.swift
//  News Watch App
//
//  Created by Talha Dikici on 24.11.2022.
//

import SwiftUI
struct ContentView: View {
    var setCategory: String?
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            ScrollView(.horizontal){
                HStack{
                    ForEach(viewModel.newses, id: \.self){ news in
                        NewsView(title: news.title, content: ((news.description == nil ? news.content : news.description)!) ,urlToImage: news.urlToImage)
                    }
                }
                .onAppear{
                    viewModel.fetch(selectedCategory: setCategory)
                }
            }
            .navigationTitle(setCategory ?? " ")
            .navigationBarTitleDisplayMode(.inline)
            .fontWeight(.ultraLight)
            .frame(alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(setCategory:"prev")
    }
}
