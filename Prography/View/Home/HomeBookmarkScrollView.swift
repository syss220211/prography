//
//  HomeBookmarkTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import Kingfisher

struct HomeBookmarkScrollView: View {
    
    @EnvironmentObject var bookmarkManager: BookmarkManager
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if !bookmarkManager.savedURL.isEmpty {
                Spacer().frame(height: 30)
                Text("북마크")
                    .font(.pretendardBold20)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows) {
                        ForEach(bookmarkManager.savedURL.indices, id: \.self) { data in
                            VStack{
    //                            Text("값 있음 테스트 ")
    //                            Text(bookmarkManager.savedURL[data])
                                KFImage(URL(string: bookmarkManager.savedURL[data]))
                                    .placeholder {
                                        ProgressView()
                                    }
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding(.vertical, 12)
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.2)
            } else {
                EmptyView()
            }
        }
        
        .onAppear {
            print(bookmarkManager.savedURL)
        }
    }
}

#Preview {
    HomeBookmarkScrollView()
        .environmentObject(BookmarkManager())
}
