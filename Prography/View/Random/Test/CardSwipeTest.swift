//
//  CardSwipeTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI

//  실패 어떻게 분리할 것인지?

enum SwipeDirection {
    case left
    case right
}

struct CardSwipeTest {
    
    static var initialOffsetY: CGFloat = 5
    static var initialRotationAngle: Double = 0.5
    
    @State private var offset = CGSize.zero
    @State private var isRemoved = false

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
