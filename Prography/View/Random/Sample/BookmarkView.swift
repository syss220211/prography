//
//  BookmarkView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import WaterfallGrid
import Kingfisher

struct BookmarkView: View {
    @ObservedObject var searchObjectManager = SearchObjectManager.shared
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("북마크")
                    .font(.custom(PretendardFont.bold, size: 20))
                
                VStack(alignment: .leading) {
                    Text("최신이미지")
                        .font(.custom(PretendardFont.bold, size: 20))
                    
                    ScrollView {
                        WaterfallGrid(searchObjectManager.photoResults, id: \.id) { result in
                            KFImage(URL(string: result.urls?.raw ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .padding(.horizontal, 15)
            .customNavigationTitle()
            .onAppear {
//                searchObjectManager.searchRandomImage()
//                searchObjectManager.searchPhotos()
            }
        }
    }
}



#Preview {
    BookmarkView()
}
