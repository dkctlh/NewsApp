//
//  HomePage.swift
//  News Watch App
//
//  Created by Talha Dikici on 24.11.2022.
//

import Foundation
import Kingfisher
import SwiftUI

struct NewsView:View{
    let title:String
    let content:String
    let urlToImage:String?
    let defaultImage = "https://gray-wbtv-prod.cdn.arcpublishing.com/resizer/48-CSPSvGP4Lbk9MHMRgpO12_nc=/800x600/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/gray/GI6N6SZLVRCDLOTRYJXRT42CSQ.png"
    var body: some View{
        ScrollView(.vertical){
            VStack {
                ZStack{
                    KFImage.url(URL(string: (urlToImage?.isEmpty == true ? defaultImage: urlToImage) ?? defaultImage ))
                        .resizable()
                        .cornerRadius(5)
                        .foregroundColor(.accentColor)
                        .frame(width: 174,height:91)
                        .padding([.trailing],12)
                        .padding([.top], 36)
                    Image(systemName:"line.3.horizontal.circle.fill" )
                        .padding([.leading],130)
                        .padding([.top],98)
                        .foregroundColor(Color(red: 0.05, green: 0.05, blue: 1))
                }
                    Spacer(minLength: 21)
                Text(title)
                    .padding([.trailing], 12)
                    .padding([.top], 1)
                    .foregroundColor(Color(red: 1, green: 1, blue: 1))
                Text(content)
                    .padding([.trailing], 12)
                    .padding([.top], 4)
                    .padding([.bottom], 16)
                    .foregroundColor(Color(red: 0.671, green: 0.671, blue: 0.671))
            }
            .frame(maxWidth: 194)
            .symbolVariant(.square)
            }
        .frame(minHeight: 242)
        }
}
