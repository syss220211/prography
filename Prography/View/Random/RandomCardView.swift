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

    var body: some View {
        NavigationStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color(UIColor.systemGray5))
                .frame(maxHeight: 1)
            Spacer()
            
            ZStack {
                //ForEach(randomCardViewModel.test, id: \.self) { images in
                //                            CardView(cardImage: images, randomCardViewModel: randomCardViewModel)
                //
                //                        }
                ForEach(randomCardViewModel.randomImage, id: \.id) { images in
                    CardView(cardImage: images.urls?.raw ?? "",
                             randomCardViewModel: randomCardViewModel)
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
    }
}

#Preview {
    RandomCardView()
}

