//
//  BookmarkTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import Kingfisher
import WaterfallGrid

class HomeViewModel: ObservableObject {
    private let searchManager = SearchObjectManager.shared
    
    @Published var testDetailPhoto: [Photos] = []
    
    func fetchTestDetailPhotos() {
        searchManager.testEscapingGetDetailPhoto { photos in
            self.testDetailPhoto = photos
        }
    }
}

struct HomeView: View {
    
    @ObservedObject var homeViewModel = HomeViewModel()
    @State private var isShowing: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationRectangleView()
                Spacer().frame(height: 30)
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("북마크")
                            .font(.pretendardBold20)
                        HomeBookmarkScrollView()
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
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
                                                isShowing.toggle()
                                            }
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
        .onAppear {
//             homeViewModel.fetchTestDetailPhotos()
        }
    }
}

#Preview {
    HomeView()
}

