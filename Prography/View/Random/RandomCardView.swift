//
//  GroupRandom.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI
import Kingfisher

/// 탭바에 들어가는 모든걸 모은 랜덤 카드가 나오는 뷰
struct RandomCardView: View {
    @StateObject private var randomCardViewModel = RandomCardViewModel()
    @State private var isBookmarked: Bool = false
//    @State private var isPopup: Bool = false
    
    @State private var photo: String = ""
    @State private var userName: String = ""
    @State private var title: String = ""
    @State private var desc: String = ""
    
    @State private var firstPhotoID: [Result] = []
    var body: some View {
        NavigationStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color(UIColor.systemGray5))
                .frame(maxHeight: 1)
            Spacer()
            
            ZStack {
                ForEach(randomCardViewModel.randomImage, id: \.id) { images in
                    CardView(cardImage: images.urls?.raw ?? "", randomCardViewModel: randomCardViewModel)
                }
                .padding(20)
            }
            .shadow(radius: 20)
            .customNavigationTitle()
            Spacer()
        }
        .onAppear {
            print("🤡 통신중")
//            randomCardViewModel.fetchImageData()
//            randomCardViewModel.fetchBackgroundImage()
        }
        .customPopupTest1(isBookmarked: $isBookmarked,
                          photo: randomCardViewModel.testRandomInfo.urls?.raw ?? "",
                          userName: randomCardViewModel.testRandomInfo.user.username,
                          isPopup: $randomCardViewModel.isTapped,
                          title: randomCardViewModel.title,
                          desc: randomCardViewModel.testRandomInfo.description ?? "",
                          tags: randomCardViewModel.testRandomInfo.tags)
    }
}

#Preview {
    RandomCardView()
}

