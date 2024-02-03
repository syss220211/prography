//
//  CardBottomBtnView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI
import Kingfisher

/// 카드 밑에 버튼 3개뷰
struct CardBottomBtnView: View {
    @ObservedObject var randomCardViewModel: RandomCardViewModel
    @EnvironmentObject private var zIndex: ZIndexManager
    
    var body: some View {
        HStack {
            Image("x")
                .padding(10)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(UIColor.systemGray4), lineWidth: 1))
                .frame(maxWidth: .infinity)
            Image("Bookmark")
                .padding(20)
                .background(Color.main)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .frame(maxWidth: .infinity)
            
            // info 보러가기
            Button {
                // zindex 팝업때만 zindex 조절하기
                zIndex.index = 0
                randomCardViewModel.isTapped.toggle()

                // MARK: - 분기 테스트
                if randomCardViewModel.photoID.isEmpty {
                    randomCardViewModel.photoID = randomCardViewModel.randomImage[1].id
                    randomCardViewModel.photoURL = randomCardViewModel.randomImage[1].urls?.raw ?? ""
                    randomCardViewModel.getRandomInfo(photoID: randomCardViewModel.randomImage[1].id)
                    randomCardViewModel.title = randomCardViewModel.randomImage[1].slug
                } else {
                    randomCardViewModel.getRandomInfo(photoID: randomCardViewModel.photoID)
                }
                
                print("📇 button id \(randomCardViewModel.photoID)")
            } label: {
                Image("info")
                    .padding(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(UIColor.systemGray4), lineWidth: 1))
                    .frame(maxWidth: .infinity)
            }
        }
        Spacer().frame(height: 15)
    }
}

#Preview {
    CardBottomBtnView(randomCardViewModel: RandomCardViewModel())
}
