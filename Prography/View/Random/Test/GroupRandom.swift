//
//  GroupRandom.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI
import Kingfisher

#Preview {
    ExtraCardView()
}

final class ExtraCardViewViewModel: ObservableObject {
    @Published var randomImage: [Result] = []
    @Published var backgroundRandomImage: Result?
    @Published var test: [String] = ["Sample1", "Sample2"]
    
    private let searchManager = SearchObjectManager.shared

    func fetchImageData() {
        (0...1).forEach { _ in
            searchManager.searchRandomImage { result in
                guard let result else { return }
                self.randomImage.append(result)
            }
        }
    }
    
    func fetchBackgroundImage() {
        searchManager.backgroundRandomImage { result in
            guard let result else { return }
            self.backgroundRandomImage = result
        }
    }
}

struct ExtraCardView: View {
    @StateObject private var extraViewModel = ExtraCardViewViewModel()

    var body: some View {
        ZStack {
//            ForEach(extraViewModel.test, id: \.self) { images in
//                RoundedCard(cardImage: images, extraCardViewModel: extraViewModel)
//            }
            
            ForEach(extraViewModel.randomImage, id: \.id) { images in
                RoundedCard(cardImage: images.urls?.raw ?? "",
                            extraCardViewModel: extraViewModel)
            }
        }
        .onAppear {
            print("🤡 onappear")
//            extraViewModel.fetchImageData()
//            extraViewModel.fetchBackgroundImage()
        }
    }
}

struct RoundedCard: View { //제스처잇음
    
    let cardImage: String
    @ObservedObject var extraCardViewModel: ExtraCardViewViewModel
    @State private var offset = CGSize.zero
    @State private var isRemoved = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(radius: 20)
            .frame(maxWidth: .infinity)
            .frame(height: UIScreen.main.bounds.height * 0.6)
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
        
        if let backgroundImage = extraCardViewModel.backgroundRandomImage {
            extraCardViewModel.randomImage[1] = extraCardViewModel.randomImage[0]
            extraCardViewModel.randomImage[0] = backgroundImage
        } else {
            extraCardViewModel.randomImage[1] = extraCardViewModel.randomImage[0]
            extraCardViewModel.randomImage[0] = Result.emptyData
        }
        
        extraCardViewModel.fetchBackgroundImage()
        
        extraCardViewModel.test.removeAll()
        extraCardViewModel.test.append("세번째")
        extraCardViewModel.test.append("네번째")
    }
}
