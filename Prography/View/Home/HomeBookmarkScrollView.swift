//
//  HomeBookmarkTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import Kingfisher

class HomeBookmarkScrollViewModel: ObservableObject {
    @Published var photo: String = ""
    @Published var userName: String = ""
    @Published var isPop: Bool = false
    @Published var title: String = ""
    @Published var desc: String = ""
    @Published var tags: [Tag] = []
    @Published var photoID: String = ""
    @Published var photoURL: String = ""
    @Published var isBookmark: Bool = true
}

struct HomeBookmarkScrollView: View {
    
    let rows = [GridItem(.flexible())]
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @EnvironmentObject private var zIndex: ZIndexManager
    
    @ObservedObject var bookmarkScrollViewModel: HomeBookmarkScrollViewModel
    @ObservedObject var homeViewModel = HomeViewModel()
    
    // 디테일 관련 변수
    @State private var isPopup: Bool = false
    @State private var isBookmarked: Bool = false

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
                                KFImage(URL(string: bookmarkManager.savedURL[data]))
                                    .placeholder {
                                        ProgressView()
                                    }
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .onTapGesture {
                                        isPopup.toggle()
                                        bookmarkScrollViewModel.photoID = bookmarkManager.savedPhotoID[data]
                                        bookmarkScrollViewModel.photoURL = bookmarkManager.savedURL[data]
                                        bookmarkScrollViewModel.title = ""
                                        bookmarkScrollViewModel.desc = homeViewModel.detailInfo.description ?? ""
                                        bookmarkScrollViewModel.tags = homeViewModel.detailInfo.tags
                                        bookmarkScrollViewModel.isPop = true
                                        bookmarkScrollViewModel.isBookmark = true
                                        homeViewModel.getDetailInfo(photoID: bookmarkManager.savedPhotoID[data])
                                        // zindex 설정추가
                                        zIndex.index = 0
                                    }
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
        .customPopup(isBookmarked: $isBookmarked,
                          photo: bookmarkScrollViewModel.photoID,
                          userName: homeViewModel.detailInfo.user.username,
                          isPopup: $isPopup,
                          title: "",
                          desc: homeViewModel.detailInfo.description ?? "",
                          tags: homeViewModel.detailInfo.tags,
                          photoID: $bookmarkScrollViewModel.photoID,
                          photoURL: $bookmarkScrollViewModel.photoURL)
    }
}

#Preview {
    HomeBookmarkScrollView(bookmarkScrollViewModel: HomeBookmarkScrollViewModel())
        .environmentObject(BookmarkManager())
}
