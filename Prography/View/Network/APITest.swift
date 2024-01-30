//
//  APITest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import WaterfallGrid
import Kingfisher

struct APITest: View {
    @ObservedObject var searchObjectManager = SearchObjectManager.shared
    
    var body: some View {
//        VStack{
//            Text("북마크")
//            
//            ScrollView {
//                WaterfallGrid(searchObjectManager.photoResults, id: \.id) { result in
//                    KFImage(URL(string: result.urls?.raw ?? ""))
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                }
//            }.padding(.horizontal, 15)
//        }
        
        List {
            ForEach(searchObjectManager.photoResults, id: \.id) { result in
                VStack {
                    Text(result.id)
                    Text(result.urls?.raw ?? "none raw")
//                    KFImage(URL(string: result.urls?.raw ?? ""))
//                        .resizable()
//                        .scaledToFit()

                }
                .foregroundColor(.black)
            }
        }
        .onAppear {
//            searchObjectManager.searchRandomImage()
//            searchObjectManager.searchPhotos()
        }
    }
}

#Preview {
    APITest()
}
