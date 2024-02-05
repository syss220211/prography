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
            randomCardViewModel.fetchImageData()
            randomCardViewModel.fetchBackgroundImage()
        }
        .onDisappear {
            randomCardViewModel.randomImage = []
            randomCardViewModel.backgroundRandomImage = nil
            randomCardViewModel.photoID = ""
            isBookmarked = false
        }
        .customPopup(isBookmarked: $isBookmarked,
                          photo: randomCardViewModel.randomPhotoInfo.urls?.raw ?? "",
                          userName: randomCardViewModel.randomPhotoInfo.user.username,
                          isPopup: $randomCardViewModel.isTapped,
                          title: randomCardViewModel.title,
                          desc: randomCardViewModel.randomPhotoInfo.description ?? "",
                          tags: randomCardViewModel.randomPhotoInfo.tags,
                          photoID: $randomCardViewModel.photoID,
                          photoURL: $randomCardViewModel.photoURL)
    }
}

#Preview {
    RandomCardView()
}

