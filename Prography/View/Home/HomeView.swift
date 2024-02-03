//
//  BookmarkTest.swift
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
    
    // 추가
    @Published var moreData: [Photos] = []
    
    @Published var testDetailPhoto: [Photos] = []
    @Published var testDetailInfo: PhotoDetail = .init(id: UUID().uuidString,
                                                       description: "",
                                                       tags: [],
                                                       urls: nil,
                                                       user: .init(username: "nothing"))
    
    func fetchTestDetailPhotos() {
        searchManager.testEscapingGetDetailPhoto { photos in
            self.testDetailPhoto = photos
        }
    }
    
    // Detail 정보값 테스트
    func testGetDetailInfo(photoID: String) {
        let url = "https://api.unsplash.com/photos/\(photoID)?client_id=BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
        
        AF.request(url).validate().responseDecodable(of: PhotoDetail.self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    print("🔥Info 함수 성공🔥")
                    self.testDetailInfo = jsonResult
                }
            case .failure(let error):
                print("🥶Info 함수 실패🥶")
                print(error.localizedDescription)
            }
        }
    }

    // 무한 스 크 롤
    func loadMoreData(completion: @escaping([Photos]) -> Void) {
        let url = "https://api.unsplash.com/photos?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: [Photos].self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    self.moreData = jsonResult
                }
            case .failure(let error):
                print("🥶디테일 함수 실패🥶")
                print(error.localizedDescription)
            }
        }
    }
}

struct HomeView: View {
    @EnvironmentObject private var zIndex: ZIndexManager
    @ObservedObject var homeViewModel = HomeViewModel()
    @EnvironmentObject var bookmarkManager: BookmarkManager
    
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
//        ZStack {
            NavigationStack {
                ScrollView {
                    NavigationRectangleView()
                    VStack(alignment: .leading, spacing: 20) {
                        HomeBookmarkScrollView()
                            .environmentObject(bookmarkManager)
                        
                        VStack(alignment: .leading) {
                            Text("최신이미지")
                                .font(.pretendardBold20)
                            
                            WaterfallGrid(homeViewModel.testDetailPhoto, id: \.id) { data in
                                Group {
                                    if let url = data.urls {
                                        ZStack(alignment: .bottomLeading) {
                                            KFImage(URL(string: url.raw))
                                                .placeholder {
                                                    ProgressView()
                                                }
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                .onTapGesture {
                                                    isPopup.toggle()
                                                    photoID = data.id
                                                    self.title = data.slug
                                                    self.desc = data.description ?? ""
                                                    self.photo = url.raw
                                                    
                                                    homeViewModel.testGetDetailInfo(photoID: self.photoID)
                                                    // zindex 설정추가
                                                    zIndex.index = 0
                                                }
                                            // 여기에서 디테일 통신하기
                                            Text(data.slug)
                                                .foregroundColor(.white)
                                                .lineLimit(2)
                                                .padding(10)
                                                .font(.prentendardMedium13)
                                        }
                                    } else {
                                        Image("Sample1")
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .customNavigationTitle()
                }
            }
            .customPopupTest1(isBookmarked: $isBookmarked,
                              photo: self.photo,
                              userName: homeViewModel.testDetailInfo.user.username,
                              isPopup: $isPopup,
                              title: self.title,
                              desc: self.desc,
                              tags: homeViewModel.testDetailInfo.tags,
                              photoID: $photoID,
                              photoURL: $photo)
//        }
        .onAppear {
             homeViewModel.fetchTestDetailPhotos()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(BookmarkManager())
}

