//
//  BackgroundView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI
import Kingfisher

struct BackgroundView: View {
    
    var initialOffsetY: CGFloat = 5
    var initialRotationAngle: Double = 0.5
    var onCardSwiped: ((SwipeDirection) -> Void)?
    
    @GestureState private var dragoffset: CGPoint = .zero
    @State private var offset = CGSize.zero
    @State private var isRemoved = false
    @ObservedObject var searchObjectManager = SearchObjectManager.shared
    @State var groupText: [String] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                SecondCard()
                    .onTapGesture {
                        print(searchObjectManager.randomText)
                    }
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(radius: 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    .overlay (
                        Text(searchObjectManager.randomText)
//                        VStack(spacing: 10) {
//                            KFImage(URL(string: searchObjectManager.randomResults?.urls?.raw ?? ""))
//                                .resizable()
//                                .scaledToFit()
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .padding(10)
//                            cardBottomBtn()
//                            
//                        }
                    )
                    .rotationEffect(.degrees(Double(offset.width / 10)))
                    .offset(x: offset.width, y: offset.height)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                                withAnimation {
                                    handleCradDragging(offset)
                                }
                            }
                            .onEnded { gesture in
                                withAnimation {
                                    handleSwipe(offsetWidth: offset.width)
                                }

//                                self.offset = .zero
                            }
                    )
//                    .opacity(isRemoved ? 0 : 1)
            }
        }
        .onAppear {
//            searchObjectManager.searchRandomImage()
//            searchObjectManager.backgroundRandomImage()
//            searchObjectManager.searchPhotos()
//            searchObjectManager.randomPhotoAppend()
        }
    }
    
    func handleCradDragging(_ offset: CGSize) {
        var swipeDirection: SwipeDirection = .left
        
        switch(offset.width) {
        case(-500...(-150)):
            swipeDirection = .left
        case(150...(500)):
            swipeDirection = .right
        default:
            break
        }
    }
    
    func removeCard(direction: SwipeDirection) {
            isRemoved = true
            checkCardSwipe(direction: direction)
        }
    
    func handleSwipe(offsetWidth: CGFloat) {
        var swipeDirection: SwipeDirection = .left
        
        switch (offsetWidth) {
        case (-500...(-150)):
            swipeDirection = .left
            searchObjectManager.randomText = searchObjectManager.backgroundText
            offset = CGSize(width: -600, height: 0)
            isRemoved = true
            checkCardSwipe(direction: swipeDirection)
        case (150...500):
            swipeDirection = .right
            searchObjectManager.randomText = searchObjectManager.backgroundText
            offset = CGSize(width: 600, height: 0)
            isRemoved = true
            checkCardSwipe(direction: swipeDirection)

        default:
            isRemoved = false
            offset = .zero
        }
    }
    
    func checkCardSwipe(direction: SwipeDirection) {
        switch direction {
        case .left:
            print("🔥swipe left, 그냥 다음 사진으로 넘어가기")
//            searchObjectManager.searchRandomImage()
        case .right:
            print("🔥swipe right, 북마크 후에 다음 사진으로 넘어가기")
        }
        self.groupText.append(searchObjectManager.randomText)
        self.groupText.append(searchObjectManager.backgroundText)
        searchObjectManager.randomText = searchObjectManager.backgroundText
    }

    @ViewBuilder
    func SecondCard() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 20)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.6)
            .overlay (
                Text(searchObjectManager.backgroundText)
//                VStack(spacing: 10) {
//                    KFImage(URL(string: searchObjectManager.backgroundImage?.urls?.raw ?? ""))
////                    Image("Sample1")
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding(10)
//                    cardBottomBtn()
//                    
//                }
            )
    }
}

#Preview {
    BackgroundView()
}
