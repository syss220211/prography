//
//  GroupRandom.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI
import Combine
import Kingfisher

struct GroupRandom: View {
    var initialOffsetY: CGFloat = 5
    var initialRotationAngle: Double = 0.5
    var onCardSwiped: ((SwipeDirection) -> Void)?
    
    @State private var offset = CGSize.zero
    @State private var isRemoved = false
    @ObservedObject var searchObjectManager = SearchObjectManager.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                SecondCard()
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .shadow(radius: 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                    .overlay (
                        KFImage(URL(string:searchObjectManager.randomSearchs?.urls?.raw ?? ""))
                            .resizable()
                            .scaledToFit()
                    )
                    .rotationEffect(.degrees(Double(offset.width / 10)))
                    .offset(x: offset.width, y: offset.height)
//                    .offset(x: isRemoved ? UIScreen.main.bounds.width : offset.width, y: offset.height)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                offset = gesture.translation
                                print("🧩\(offset.width)")
                                withAnimation {
                                    handleCradDragging(offset)
                                }
                            }
                            .onEnded { gesture in
                                withAnimation {
                                    handleSwipe(offsetWidth: offset.width)
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.offset = .zero
                                }
                            }
                        
                    )
                    .opacity(offset.width > 180 ? 0 : 1)
            }
            .onAppear {
//                searchObjectManager.combineRandomImage()
//                searchObjectManager.searchRandomImage()
            }
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
    
    func handleSwipe(offsetWidth: CGFloat) {
        var swipeDirection: SwipeDirection = .left
        
        switch (offsetWidth) {
        case (-500...(-150)):
            swipeDirection = .left
            offset = CGSize(width: -600, height: 0)
            checkCardSwipe(direction: swipeDirection)
//            isRemoved = true
        case (150...500):
            swipeDirection = .right
            offset = CGSize(width: 600, height: 0)
            checkCardSwipe(direction: swipeDirection)
//            isRemoved = true
        default:
            offset = .zero
//            isRemoved = false
        }
    }
    
    func checkCardSwipe(direction: SwipeDirection) {
        switch direction {
        case .left:
            print("🔥swipe left, 그냥 다음 사진으로 넘어가기")
        case .right:
            print("🔥swipe right, 북마크 후에 다음 사진으로 넘어가기")
        }
//        searchObjectManager.randomSearchs = searchObjectManager.randomResults
//        searchObjectManager.searchRandomImage()
        
    }

    @ViewBuilder
    func SecondCard() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 20)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.6)
            .overlay (
                KFImage(URL(string:searchObjectManager.randomResults?.urls?.raw ?? ""))
//                KFImage(URL(string:searchObjectManager.randomSearchs?.urls?.raw ?? ""))
                    .resizable()
                    .scaledToFit()
            )
            
    }
}

#Preview {
    GroupRandom()
}
