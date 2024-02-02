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
//    @ObservedObject var searchObjectManager = SearchObjectManager.shared
    private let searchManager = SearchObjectManager.shared
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("북마크")
                    .font(.pretendardBold20)
                
                VStack(alignment: .leading) {
                    Text("최신이미지")
                        .font(.pretendardBold20)
                    
                    ScrollView {
                        WaterfallGrid(searchManager.photoResults, id: \.id) { result in
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
        }
    }
}



#Preview {
    BookmarkView()
}
