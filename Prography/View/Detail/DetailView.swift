//
//  DetailView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI

struct DetailView: ViewModifier {
    @State var isBookmarked: Bool = false
    @Binding var isPopup: Bool
    
//    var body: some View {
    func body(content: Content) -> some View {
        if isPopup {
            ZStack {
                Text("ddd")
            }
        } else {
            content
        }
//        ZStack {
//            Color.black
//                .opacity(0.8)
//                .ignoresSafeArea()
//            VStack(alignment: .leading) {
//                
//                HStack {
//                    Button {
//                        print("닫기 버튼 tapped")
//                    } label: {
//                        Image(systemName: "xmark")
//                            .foregroundColor(.black)
//                            .padding(8)
//                            .background(.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 50))
//                    }
//                    
//                    Text("Username")
//                        .font(.custom(PretendardFont.bold, size: 20))
//                    
//                    Spacer()
//                    HStack(spacing: 15) {
//                        Image("save")
//                        
//                        Button {
//                            print("북마크에 사진 저장")
//                            isBookmarked.toggle()
//                        } label: {
//                            Image("bookmark")
//                                .opacity(isBookmarked ? 1.0 : 0.5)
//                        }
//
//                    }
//                }
//                
//                Image("Sample1")
//                    .resizable()
//                    .scaledToFit()
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    Text("title")
//                        .font(.custom(PretendardFont.bold, size: 20))
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("description 최대 2줄")
//                            .lineLimit(2)
//                        Text("#tag")
//                    }
//                    .font(.custom(PretendardFont.medium, size: 15))
//                }
//            }
//            .foregroundColor(.white)
//            .padding(.horizontal, 10)
//        }
    }
}

extension View {
    func popup(isPopup: Binding<Bool>) -> some View {
        self.modifier(DetailView(isPopup: isPopup))
    }
}

struct DetailText: View {
    @State var ispop: Bool = false
    
    var body: some View {
        ZStack {
            HomeView()
            
            Color.clear
                .popup(isPopup: $ispop)
        }
//        .popup(isPopup: $ispop)
    }
}

#Preview {
    DetailText()
}
