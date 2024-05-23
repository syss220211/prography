//
//  CardView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/02.
//

import SwiftUI
import Kingfisher


enum SwipeDirection {
    case left
    case right
}

struct CardView: View {
    
    let cardImage: String    
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @ObservedObject var randomCardViewModel: RandomCardViewModel
    @State private var offset = CGSize.zero
    @State private var isRemoved = false
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                if !cardImage.isEmpty {
                    Rectangle()
                        .fill(.black)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                    KFImage(URL(string: cardImage))
                        .placeholder({
                            ProgressView()
                        })
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        
                } else {
                    // 이미지 값이 없을 경우
                    Image("Sample1")
                        .resizable()
                        .frame(width: .infinity)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        .scaledToFit()
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(10)
            CardBottomBtnView(randomCardViewModel: randomCardViewModel)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .rotationEffect(.degrees(Double(offset.width / 10)))
        .offset(x: offset.width, y: offset.height)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    withAnimation {
                        offset = gesture.translation
                    }
                }
                .onEnded { gesture in
                    withAnimation {
                        handleSwipe(offsetWidth: offset.width)
                    }
                }
        )
        .shadow(radius: 10)
    }
    
    private func handleSwipe(offsetWidth: CGFloat) {
        var swipeDirection: SwipeDirection = .left
        
        switch (offsetWidth) {
        case (-500...(-150)):
            swipeDirection = .left
            offset = CGSize(width: -600, height: 0)
            checkCardSwipe(direction: swipeDirection)
        case (150...500):
            swipeDirection = .right
            offset = CGSize(width: 600, height: 0)
            checkCardSwipe(direction: swipeDirection)
        default:
            offset = .zero
        }
        
    }
    
    private func checkCardSwipe(direction: SwipeDirection) {
        switch direction {
        case .left:
            print("🔥swipe left, 그냥 다음 사진으로 넘어가기")
        case .right:
            print("🔥swipe right, 북마크 후에 다음 사진으로 넘어가기")
            bookmarkManager.photoID = randomCardViewModel.photoID
            bookmarkManager.photoURL = cardImage
            bookmarkManager.addString(photoURL: cardImage)
        }
        
        // MARK: - info버튼에 값 넘기기
        randomCardViewModel.photoURL = randomCardViewModel.randomImage[0].urls?.raw ?? ""
        randomCardViewModel.title = randomCardViewModel.randomImage[0].slug
        randomCardViewModel.photoID = randomCardViewModel.randomImage[0].id
        
        if let backgroundImage = randomCardViewModel.backgroundRandomImage {
            randomCardViewModel.randomImage[1] = randomCardViewModel.randomImage[0]
            randomCardViewModel.randomImage[0] = backgroundImage
        } else {
            randomCardViewModel.randomImage[1] = randomCardViewModel.randomImage[0]
            randomCardViewModel.randomImage[0] = RandomResult.emptyData
        }
        
        randomCardViewModel.fetchBackgroundImage()
    }
}

#Preview {
    CardView(cardImage: "Sample1", randomCardViewModel: RandomCardViewModel())
}
