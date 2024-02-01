//
//  CardSample2View.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI

struct CardSample2View: View {
    var initialOffsetY: CGFloat = 5
    var initialRotationAngle: Double = 0.5
    
    @State private var offset = CGSize.zero
    @State private var isRemoved = false
    
    var body: some View {
        NavigationStack {
            Rectangle()
                .frame(maxWidth: .infinity)
                .foregroundStyle(Color(UIColor.systemGray5))
                .frame(maxHeight: 1)
            Spacer()
            ZStack {
                CardTView()
                    .padding(20)
            }
            .shadow(radius: 10)
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                }
            }
            .rotationEffect(.degrees(Double(offset.width / 40)))
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
                    }
            )
            .opacity(isRemoved ? 0 : 1)
            Spacer()
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
            offset = CGSize(width: -500, height: 0)
            checkCardSwipe(direction: swipeDirection)
        case (150...500):
            swipeDirection = .right
            offset = CGSize(width: 500, height: 0)
            checkCardSwipe(direction: swipeDirection)
        default:
            offset = .zero
        }
    }
    
    func checkCardSwipe(direction: SwipeDirection) {
        switch direction {
        case .left:
            print("🔥swipe left")
        case .right:
            print("🔥swipe right")
        }
    }
}

#Preview {
    CardSample2View()
}
