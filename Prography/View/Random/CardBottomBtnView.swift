//
//  CardBottomBtnView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI
import Kingfisher

/// 카드 밑에 버튼 3개뷰
struct CardBottomBtnView: View {
    var body: some View {
        HStack {
            Image("x")
                .padding(10)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(UIColor.systemGray4), lineWidth: 1))
                .frame(maxWidth: .infinity)
            Image("Bookmark")
                .padding(20)
                .background(Color.main)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .frame(maxWidth: .infinity)
            Image("info")
                .padding(10)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(UIColor.systemGray4), lineWidth: 1))
                .frame(maxWidth: .infinity)
        }
        Spacer().frame(height: 15)
    }
}

#Preview {
    CardBottomBtnView()
}
