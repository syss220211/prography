//
//  CustomPopView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/02.
//

import SwiftUI
import Kingfisher

enum BookMarkType {
    case lastest
    case random
    case delete
}

class BookmarkManager: ObservableObject {
    @Published var photoURL: String = ""
    @Published var photoID: String = ""
    @Published var savedURL: [String] = UserDefaults.standard.stringArray(forKey: "BookmarkURL") ?? []
    @Published var savedPhotoID: [String] = UserDefaults.standard.stringArray(forKey: "BookmarkID") ?? []
    
    func addString(photoURL: String) {
        // Url 저장
        savedURL.append(photoURL)
        UserDefaults.standard.set(savedURL, forKey: "BookmarkURL")
        
        // ID 저장
        savedPhotoID.append(photoID)
        UserDefaults.standard.set(savedURL, forKey: "BookmarkID")
    }
    
    func removeString(photoURL: String, photoID: String) {
        guard let removeURL = savedURL.firstIndex(of: photoURL) else { return }
        savedURL.remove(at: removeURL)
        
        guard let removeID = savedURL.firstIndex(of: photoID) else { return }
        savedPhotoID.remove(at: removeID)
        
        // 해당 배열 다시 저장
        UserDefaults.standard.set(savedURL, forKey: "BookmarkURL")
        UserDefaults.standard.set(savedPhotoID, forKey: "BookmarkID")
    }
}

struct CustomPopView: ViewModifier {
    
    @Binding var isBookmarked: Bool
    var photo: String
    var userName: String
    @Binding var isPopup: Bool
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
                                    print("🥹\(photoID)")
                                    print("🥹🥹\(photoURL)")
                                    
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
    func customPopupTest1(isBookmarked: Binding<Bool>,
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
                                    photo: photo,
                                    userName: userName,
                                    isPopup: isPopup,
                                    title: title,
                                    desc: desc,
                                    tags: tags,
                                    photoID: photoID,
                                    photoURL: photoURL))
    }
}

struct PopupTest: View {
    @State private var isBookmarked: Bool = false
    @State private var isPopup: Bool = true
    
    private var photo: String = "Sample1"
    private var userName: String = "박서연"
    private var title: String = "사진제목"
    private var desc: String = "사진 설명이고 최대 2줄"
    private var tags: [Tag] = [Tag(title: "태그saasdf1"), Tag(title: "태그sadfasdf2"), Tag(title: "태asdfsadf그3"), Tag(title: "태asdfsadfsdf그4")]
    
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
//        .customPopupTest1(isBookmarked: $isBookmarked,
//                          photo: photo,
//                          userName: userName,
//                          isPopup: $isPopup,
//                          title: title,
//                          desc: desc,
//                          tags: tags)
    }
}

#Preview {
    PopupTest()
}

