//
//  View+Extension.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI

/// x, info 버튼 모디파이어
struct ButtonStrokeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(UIColor.systemGray4), lineWidth: 1))
            .frame(maxWidth: .infinity)
    }
}

// 네이게이션 타이틀 커스텀
struct NavigationTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                }
            }
    }
}

extension View {
    func buttonStroke() -> some View {
        self.modifier(ButtonStrokeModifier())
    }
    
    func customNavigationTitle() -> some View {
        self.modifier(NavigationTitle())
    }
}

