//
//  PhotoPopup.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI

struct PhotoPopupView: View {
    @State var isBookmarked: Bool = false
    @Binding var userName: String
    @Binding var isPopup: Bool
    @Binding var title: String
    @Binding var desc: String
    @Binding var tags: [String]
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.8)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                
                HStack {
                    Button {
                        print("닫기 버튼 tapped")
                        isPopup.toggle()
                        
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(8)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    
                    Text(userName)
                        .font(.pretendardBold20)
                    
                    Spacer()
                    HStack(spacing: 15) {
                        Image("save")
                        
                        Button {
                            print("북마크에 사진 저장")
                            isBookmarked.toggle()
                        } label: {
                            Image("bookmark")
                                .opacity(isBookmarked ? 1.0 : 0.5)
                        }

                    }
                }
                
                Image("Sample1")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.pretendardBold20)
                    VStack(alignment: .leading, spacing: 8) {
                        Text(desc)
                            .lineLimit(2)
                        Text(tags.first ?? "not tags")
                    }
                    .font(.prentendardMedium15)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    PhotoPopupView(userName: .constant("username"), isPopup: .constant(true), title: .constant("title"), desc: .constant("desc"), tags: .constant([""]))
}
