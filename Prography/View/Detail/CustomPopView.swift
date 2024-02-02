//
//  CustomPopView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/02.
//

import SwiftUI

struct CustomPopView: ViewModifier {
    @Binding var isBookmarked: Bool
    @Binding var photo: String
    @Binding var userName: String
    @Binding var isPopup: Bool
    @Binding var title: String
    @Binding var desc: String
    @Binding var tags: [String]
    
    func body(content: Content) -> some View {
        content.overlay {
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
                    
                    Image(photo)
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
            .opacity(isPopup ? 1 : 0)
            .animation(.easeInOut, value: isPopup)
        }
    }
}

extension View {
    func customPopupTest1(isBookmarked: Binding<Bool>,
                          photo: Binding<String>,
                          userName: Binding<String>,
                          isPopup: Binding<Bool>,
                          title: Binding<String>,
                          desc: Binding<String>,
                          tags: Binding<[String]>)
    -> some View {
        self.modifier(CustomPopView(isBookmarked: isBookmarked,
                                    photo: photo,
                                    userName: userName,
                                    isPopup: isPopup,
                                    title: title,
                                    desc: desc,
                                    tags: tags))
    }
}

struct PopupTest: View {
    @State private var isBookmarked: Bool = false
    @State private var photo: String = "Sample1"
    @State private var userName: String = "박서연"
    @State private var isPopup: Bool = false
    @State private var title: String = "사진제목"
    @State private var desc: String = "사진 설명이고 최대 2줄"
    @State private var tags: [String] = ["태그", "태그2", "태그3", "태그4", "태그5", "태그6"]
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack {
                Button {
                    isPopup.toggle()
                } label: {
                    Text("pop up test")
                }
                
                Text("dd")
            }
            
        }
        .customPopupTest1(isBookmarked: $isBookmarked,
                          photo: $photo,
                          userName: $userName,
                          isPopup: $isPopup,
                          title: $title,
                          desc: $desc,
                          tags: $tags)
    }
}

#Preview {
    PopupTest()
}

