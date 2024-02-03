//
//  HomeViewModel.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import Kingfisher
import WaterfallGrid
import Alamofire

class HomeViewModel: ObservableObject {
    private let searchManager = SearchObjectManager.shared
    private let accessKey = "BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
    
    @Published var isBookmarked: Bool = false
    @Published var popup: Bool = false
    @Published var photoID: String = ""
    @Published var title: String = ""
    @Published var desc: String = ""
    @Published var photo: String = ""

    
    @Published var photoForDetail: [Photos] = []
    @Published var detailInfo: PhotoDetail = .init(id: UUID().uuidString,
                                                       description: "",
                                                       tags: [],
                                                       urls: nil,
                                                       user: .init(username: "nothing"))
    
    func fetchPhotoDetail() {
        searchManager.getDetailPhoto { photos in
            self.photoForDetail = photos
        }
    }
    
    // Detail 정보값 테스트
    func getDetailInfo(photoID: String) {
        let url = "https://api.unsplash.com/photos/\(photoID)?client_id=BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
        
        AF.request(url).validate().responseDecodable(of: PhotoDetail.self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    print("🔥Info 함수 성공🔥")
                    self.detailInfo = jsonResult
                }
            case .failure(let error):
                print("🥶Info 함수 실패🥶")
                print(error.localizedDescription)
            }
        }
    }
}

struct HomeView: View {
    @EnvironmentObject private var zIndex: ZIndexManager
    @ObservedObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @StateObject private var bookmarkScrollViewModel = HomeBookmarkScrollViewModel()
    // popup
    @State private var isPopup: Bool = false
    @State private var isBookmarked: Bool = false
    @State private var photoID: String = ""
    @State private var photo: String = ""
    @State private var title: String = ""
    @State private var desc: String = ""
    
    // 무한 스크롤
    @State private var isFinished = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    NavigationRectangleView()
                    VStack(alignment: .leading, spacing: 20) {
                        HomeBookmarkScrollView(bookmarkScrollViewModel: bookmarkScrollViewModel)
                            .environmentObject(bookmarkManager)
                        
                        VStack(alignment: .leading) {
                            Text("최신이미지")
                                .font(.pretendardBold20)
                            PhotoGridView(homeViewModel.photoForDetail, homeViewModel: homeViewModel)
                            
                            // MARK: - 라이브러리랑 커스텀 중에 선택
//                            WaterfallGrid(homeViewModel.photoForDetail, id: \.id) { data in
//                                Group {
//                                    if let url = data.urls {
//                                        ZStack(alignment: .bottomLeading) {
//                                            KFImage(URL(string: url.raw))
//                                                .placeholder {
//                                                    ProgressView()
//                                                }
//                                                .resizable()
//                                                .aspectRatio(contentMode: .fit)
//                                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                                .onTapGesture {
//                                                    isPopup.toggle()
//                                                    self.photoID = data.id
//                                                    self.title = data.slug
//                                                    self.desc = data.description ?? ""
//                                                    self.photo = url.raw
//                                                    
//                                                    homeViewModel.testGetDetailInfo(photoID: self.photoID)
//                                                    // zindex 설정추가
//                                                    zIndex.index = 0
//                                                }
//                                            // 여기에서 디테일 통신하기
//                                            Text(data.slug)
//                                                .foregroundColor(.white)
//                                                .lineLimit(2)
//                                                .padding(10)
//                                                .font(.prentendardMedium13)
//                                        }
//                                    } else {
//                                        Image("Sample1")
//                                    }
//                                }
//                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .customNavigationTitle()
                }
            }
        }
        .onAppear {
             homeViewModel.fetchPhotoDetail()
        }
        .customPopup(isBookmarked: $homeViewModel.isBookmarked,
                     photo: homeViewModel.photo,
                          userName: homeViewModel.detailInfo.user.username,
                          isPopup: $homeViewModel.popup,
                          title: homeViewModel.title,
                          desc: homeViewModel.desc,
                          tags: homeViewModel.detailInfo.tags,
                          photoID: $photoID,
                          photoURL: $photo)
    }
}

#Preview {
    HomeView()
        .environmentObject(BookmarkManager())
}

