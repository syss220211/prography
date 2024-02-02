//
//  CardView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/02.
//

import SwiftUI
import Kingfisher

// MARK: - TODO : MVVM 패턴 분리 필요

struct CardView: View {
    let cardImage: String
    @ObservedObject var randomCardViewModel: RandomCardViewModel
    @State private var offset = CGSize.zero
    @State private var isRemoved = false
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                if !cardImage.isEmpty {
                    Rectangle()
                        .fill(.black)
                        .frame(width: .infinity)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
//                    Image(cardImage) // 테스트 이미지
                    KFImage(URL(string: cardImage))
                        .placeholder({
                            ProgressView()
                        })
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity)
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
            CardBottomBtnView()
        }
        .background(.white)
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
        .clipShape(RoundedRectangle(cornerRadius: 10))
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
        }
        
        if let backgroundImage = randomCardViewModel.backgroundRandomImage {
            randomCardViewModel.randomImage[1] = randomCardViewModel.randomImage[0]
            randomCardViewModel.randomImage[0] = backgroundImage
        } else {
            randomCardViewModel.randomImage[1] = randomCardViewModel.randomImage[0]
            randomCardViewModel.randomImage[0] = Result.emptyData
        }
        
        randomCardViewModel.fetchBackgroundImage()
    }
}

#Preview {
    CardView(cardImage: "Sample1", randomCardViewModel: RandomCardViewModel())
}

/*
 //
 //  CardView.swift
 //  Prography
 //
 //  Created by 박서연 on 2024/02/02.
 //

 import SwiftUI
 import Kingfisher

 struct CardView: View { //제스처잇음
     
     let cardImage: String
     @ObservedObject var randomCardViewModel: RandomCardViewModel
     @State private var offset = CGSize.zero
     @State private var isRemoved = false
     
     var body: some View {
         VStack(spacing: 10) {
             RoundedRectangle(cornerRadius: 10)
                 .fill(.white)
                 .frame(maxWidth: .infinity)
                 .overlay (
     //                Image(cardImage)
     //                    .resizable()
     //                    .scaledToFit()
                     Group {
                         if !cardImage.isEmpty {
                             KFImage(URL(string: cardImage))
                                 .placeholder({
                                     ProgressView()
                                 })
                                 .resizable()
                                 .scaledToFit()
 //                                Text(cardImage)
                         } else {
                             Image("Sample1")
                                 .resizable()
                                 .scaledToFit()
                         }
                     }

                 )
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
             
             CardBottomBtnView()
         }
         .frame(height: UIScreen.main.bounds.height * 0.6)
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
         }
         
         if let backgroundImage = randomCardViewModel.backgroundRandomImage {
             randomCardViewModel.randomImage[1] = randomCardViewModel.randomImage[0]
             randomCardViewModel.randomImage[0] = backgroundImage
         } else {
             randomCardViewModel.randomImage[1] = randomCardViewModel.randomImage[0]
             randomCardViewModel.randomImage[0] = Result.emptyData
         }
         
         randomCardViewModel.fetchBackgroundImage()
         
 //        randomCardViewModel.test.removeAll()
 //        randomCardViewModel.test.append("세번째")
 //        randomCardViewModel.test.append("네번째")
     }
 }


 #Preview {
     CardView(cardImage: "Sample1", randomCardViewModel: RandomCardViewModel())
 }

 */
