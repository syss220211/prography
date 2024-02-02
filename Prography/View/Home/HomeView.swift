//
//  BookmarkTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import Kingfisher
import WaterfallGrid

struct HomeView: View {
    @State var isShowing: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                NavigationRectangleView()
                Spacer().frame(height: 30)
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("북마크")
                            .font(.pretendardBold20)
                        HomeBookmarkScrollView()
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("최신이미지")
                            .font(.pretendardBold20)
                        
                            WaterfallGrid(Sample.data, id: \.self) { index in
                                ZStack(alignment: .bottom) {
                                    Image(index.name)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .onTapGesture {
                                            isShowing.toggle()
                                        }
                                    Text(index.descritpion)
                                        .foregroundColor(.white)
                                        .lineLimit(2)
                                        .padding(10)
                                        .font(.prentendardMedium13)
                                }
                                
                            }
                    }
                }
                .padding(.horizontal, 20)
                .customNavigationTitle()
            }
        }
        .popup(isPopup: $isShowing)
    }
}

#Preview {
    HomeView()
}

