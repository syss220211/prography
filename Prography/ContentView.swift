////
////  ContentView.swift
////  Prography
////
////  Created by 박서연 on 2024/01/30.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State private var cards = ["Card 1", "Card 2", "Card 3", "Card 4"]
//    @State private var offset: CGSize = .zero
//    @State private var currentIndex: Int = 0
//
//    var body: some View {
//        ZStack {
//            ForEach(0..<cards.count, id: \.self) { index in
//                CardView(card: cards[index])
//                    .offset(x: index == currentIndex ? offset.width : 0, y: 0)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { gesture in
//                                offset = gesture.translation
//                            }
//                            .onEnded { gesture in
//                                withAnimation {
//                                    if abs(offset.width) > 100 {
//                                        offset.width = offset.width > 0 ? 400 : -400
//                                        currentIndex += offset.width > 0 ? 1 : -1
////                                        currentIndex = currentIndex.clamped(to: 0..<cards.count)
//                                    } else {
//                                        offset = .zero
//                                    }
//                                }
//                            }
//                    )
//            }
//        }
//    }
//}
//
//struct CardView: View {
//    let card: String
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .fill(Color.blue)
//            .frame(width: 300, height: 200)
//            .overlay(
//                Text(card)
//                    .foregroundColor(.white)
//            )
//    }
//}
//
//extension Comparable {
//    func clamped(to range: ClosedRange<Self>) -> Self {
//        return min(max(self, range.lowerBound), range.upperBound)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
