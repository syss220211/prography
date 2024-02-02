////
////  RectangleTest.swift
////  Prography
////
////  Created by 박서연 on 2024/01/31.
////
//
//import SwiftUI
//import Kingfisher
//
//
//struct RectanglePhotoView: View {
//    
//    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .fill(.white)
//            .shadow(radius: 20)
//            .frame(maxWidth: .infinity)
//            .frame(height: UIScreen.main.bounds.height * 0.6)
//            .overlay (
//                VStack(spacing: 10) {
////                    KFImage(URL(string: imageURL))
//                    Image("Sample1")
//                        .resizable()
//                        .scaledToFit()
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding(10)
//                    cardBottomBtn()
//                    
//                }
//            )
//            .padding(.horizontal, 30)
//            .customNavigationTitle()
//    }
//}
//
//struct RectangleTest: View {
//    var initialOffsetY: CGFloat = 5
//    var initialRotationAngle: Double = 0.5
//    var onCardSwiped: ((SwipeDirection) -> Void)?
//    
//    @State private var offset = CGSize.zero
//    @State private var isRemoved = false
//    
//    @ObservedObject var searchObjectManager = SearchObjectManager.shared
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
////                VStack {
////                    Button {
////                        print(searchObjectManager.randomResults?.urls?.raw ?? "none")
////                    } label: {
////                        Text("ddddd")
////                    }
////                    
//////                    ForEach(searchObjectManager.randomPhotos.indices, id: \.self) { index in
//////                    }
////                }
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(.white)
//                    .shadow(radius: 20)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: UIScreen.main.bounds.height * 0.6)
//                    .overlay (
//                        VStack(spacing: 10) {
//                            KFImage(URL(string: searchObjectManager.randomResults?.urls?.raw ?? ""))
//                                .resizable()
//                                .scaledToFit()
//                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .padding(10)
//                            cardBottomBtn()
//                            
//                        }
//                    )
//                    .rotationEffect(.degrees(Double(offset.width / 10)))
//                    .offset(x: offset.width, y: offset.height)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { gesture in
//                                offset = gesture.translation
//                                withAnimation {
//                                    handleCradDragging(offset)
//                                }
//                            }
//                            .onEnded { gesture in
//                                withAnimation {
//                                    handleSwipe(offsetWidth: offset.width)
//                                }
//                            }
//                    )
//                    .opacity(isRemoved ? 0 : 1)
////                RectanglePhotoView()
////                    .rotationEffect(.degrees(Double(offset.width / 10)))
////                    .offset(x: offset.width, y: offset.height)
////                    .gesture(
////                        DragGesture()
////                            .onChanged { gesture in
////                                offset = gesture.translation
////                                withAnimation {
////                                    handleCradDragging(offset)
////                                }
////                            }
////                            .onEnded { gesture in
////                                withAnimation {
////                                    handleSwipe(offsetWidth: offset.width)
////                                }
////                            }
////                    )
////                    .opacity(isRemoved ? 0 : 1)
//            }
//        }
//        .onAppear {
////            searchObjectManager.searchRandomImage()
////            searchObjectManager.searchPhotos()
////            searchObjectManager.randomPhotoAppend()
//        }
//    }
//    
//    func handleCradDragging(_ offset: CGSize) {
//        var swipeDirection: SwipeDirection = .left
//        
//        switch(offset.width) {
//        case(-500...(-150)):
//            swipeDirection = .left
//        case(150...(500)):
//            swipeDirection = .right
//        default:
//            break
//        }
//    }
//    
//    func removeCard(direction: SwipeDirection) {
//            isRemoved = true
//            checkCardSwipe(direction: direction)
//        }
//    
//    func handleSwipe(offsetWidth: CGFloat) {
//        var swipeDirection: SwipeDirection = .left
//        
//        switch (offsetWidth) {
//        case (-500...(-150)):
//            swipeDirection = .left
//            offset = CGSize(width: -500, height: 0)
//            isRemoved = true
//            checkCardSwipe(direction: swipeDirection)
//        case (150...500):
//            swipeDirection = .right
//            offset = CGSize(width: 500, height: 0)
//            isRemoved = true
//            checkCardSwipe(direction: swipeDirection)
//        default:
//            offset = .zero
//        }
//    }
//    
//    func checkCardSwipe(direction: SwipeDirection) {
//        switch direction {
//        case .left:
//            print("🔥swipe left, 그냥 다음 사진으로 넘어가기")
//            searchObjectManager.searchRandomImage()
//        case .right:
//            print("🔥swipe right, 북마크 후에 다음 사진으로 넘어가기")
//            searchObjectManager.searchRandomImage()
//        }
//    }
//}
//
//#Preview {
//    RectangleTest()
//}
//
//struct cardBottomBtn: View {
//    var body: some View {
//        HStack {
//            Button(action: {
//                print("x버튼 tapped")
//            }, label: {
//                Image("x")
//                    .buttonStroke()
//            })
//            
//            Button(action: {
//                print("북마크에 저장")
//            }, label: {
//                Image("Bookmark")
//                    .padding(20)
//                    .background(Color.main)
//                    .clipShape(RoundedRectangle(cornerRadius: 50))
//                    .frame(maxWidth: .infinity)
//            })
//            
//            Button(action: {
//                print("info버튼 tapped, DetailView로 이동해야함")
//            }, label: {
//                Image("info")
//                    .buttonStroke()
//            })
//        }
//        Spacer().frame(height: 20)
//    }
//}
//
