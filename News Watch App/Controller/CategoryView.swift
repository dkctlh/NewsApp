//
//  CategoryView.swift
//  News Watch App
//
//  Created by Talha Dikici on 24.11.2022.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        NavigationView{
            List{
                Text("Select a Category")
                    .foregroundColor(Color(red: 0.688, green: 0.688, blue: 0.688))
                ForEach(categories, id: \.self) { cat in
                    NavigationLink(destination: ContentView(setCategory: cat.description)){
                        Text(cat.description)
                    }
                }
            }
            .navigationTitle("News Categories")
            .fontWeight(.ultraLight)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

