//
//  BookmarkTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import Kingfisher
import WaterfallGrid

struct HomeViewTest: View {
    @State var isShowing: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color(UIColor.systemGray5))
                    .frame(maxHeight: 1)
                VStack(alignment: .leading, spacing: 20) {
                    Spacer().frame(height: 20)
                    
                    Text("북마크")
                        .font(.custom(PretendardFont.bold, size: 20))
                    HomeBookmarkTest()
                    
                    VStack(alignment: .leading) {
                        Text("최신이미지")
                            .font(.custom(PretendardFont.bold, size: 20))
                        
//                        ScrollView {
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
                                        .font(.custom(PretendardFont.medium, size: 13))
                                }
                                
                            }
//                        }
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
    HomeViewTest()
}
