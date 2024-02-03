//
//  CustomPopView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/02.
//
import SwiftUI
import Kingfisher

struct CustomPopView: ViewModifier {
    
    @Binding var isBookmarked: Bool
    @Binding var isPopup: Bool
    var photo: String
    var userName: String
    var title: String
    var desc: String
    var tags: [Tag]
    
    // 북마크 저장을 위해서 id랑 url 전달받기
    @Binding var photoID: String
    @Binding var photoURL: String
    
    @EnvironmentObject var bookmarkManager: BookmarkManager
    @EnvironmentObject private var zIndex: ZIndexManager
    
    func body(content: Content) -> some View {
        content
            .overlay {
                ZStack {
                    Color.black
                        .opacity(0.8)
                        .ignoresSafeArea()
                    VStack(alignment: .leading) {
                        HStack {
                            Button {
                                print("닫기 버튼 tapped")
                                isPopup.toggle()
                                zIndex.index = 1
                                // 북마크 초기화
                                isBookmarked = false
                                
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
                                    isBookmarked.toggle()
                                    bookmarkManager.photoID = photoID
                                    bookmarkManager.photoURL = photoURL
                                    bookmarkManager.addString(photoURL: photoURL)
                                } label: {
                                    Image("bookmark")
                                        .opacity(isBookmarked ? 1.0 : 0.5)
                                }
                                
                            }
                        }
                        
                        Spacer()
                        KFImage(URL(string: photo))
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Spacer()
                        VStack(alignment: .leading, spacing: 4) {
                            Text(title)
                                .font(.pretendardBold20)
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text(desc)
                                    .lineLimit(2)
                                    .font(.prentendardMedium15)
                                HStack {
                                    ForEach(tags.prefix(4), id: \.self) { tag in
                                        Text("#\(tag.title)")
                                            .font(.prentendardMedium15)
                                            .lineLimit(1)
                                    }
                                }
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
    func customPopup(isBookmarked: Binding<Bool>,
                          photo: String,
                          userName: String,
                          isPopup: Binding<Bool>,
                          title: String,
                          desc: String,
                          tags: [Tag],
                          photoID: Binding<String>,
                          photoURL: Binding<String>)
    -> some View {
        self.modifier(CustomPopView(isBookmarked: isBookmarked,
                                    isPopup: isPopup, 
                                    photo: photo,
                                    userName: userName,
                                    title: title,
                                    desc: desc,
                                    tags: tags,
                                    photoID: photoID,
                                    photoURL: photoURL))
    }
}
