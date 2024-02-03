//
//  PhotoGridView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/04.
//

import SwiftUI
import Kingfisher

struct PhotoGridView: View {
    @EnvironmentObject var zIndex: ZIndexManager
    @ObservedObject var homeViewModel: HomeViewModel
    let photos: [Photos]
    let onTileCallback: ((Photos) -> Void)?
    
    // 추가
    @State private var loadedPhotos: [[Photos]] = []
    
    init(_ pictures: [Photos], onTileAppear: ((Photos) -> Void)? = nil, homeViewModel: HomeViewModel) {
        self.photos = pictures
        self.onTileCallback = onTileAppear
        self.homeViewModel = homeViewModel
    }
    
    private var splitArray: [[Photos]] {
        var result: [[Photos]] = []
        
        var list1: [Photos] = []
        var list2: [Photos] = []
        
        photos.forEach { photo in
            let index = photos.firstIndex {$0.id == photo.id }
            
            if let index = index {
                if index % 2 == 0  {
                    list1.append(photo)
                } else {
                    list2.append(photo)
                }
            }
        }
        result.append(list1)
        result.append(list2)
        return result
        
    }
    
    var body: some View {
        
        ScrollViewReader { scrollViewProxy in
            HStack(alignment: .top) {
                
                LazyVStack(spacing: 8) {
                    ForEach(splitArray[0]) { photo in
                        ZStack(alignment: .bottomLeading) {
                            KFImage(URL(string: "\(photo.urls?.raw ?? "")"))
                                .placeholder {
                                    ProgressView()
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            // 여기에서 디테일 통신하기
                            Text(photo.slug)
                                .foregroundColor(.white)
                                .lineLimit(2)
                                .padding(10)
                                .font(.prentendardMedium13)
                        }
                        .onTapGesture {
                            homeViewModel.photoID = photo.id
                            homeViewModel.title = photo.slug
                            homeViewModel.desc = photo.description ?? ""
                            homeViewModel.photo = photo.urls?.raw ?? ""
                            homeViewModel.popup = true

                            homeViewModel.getDetailInfo(photoID: photo.id)
                        }
                    }
                }
                
                LazyVStack(spacing: 8) {
                    ForEach(splitArray[1]) { photo in
                        ZStack(alignment: .bottomLeading) {
                            KFImage(URL(string: "\(photo.urls?.raw ?? "")"))
                                .placeholder {
                                    ProgressView()
                                }
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            // 여기에서 디테일 통신하기
                            Text(photo.slug)
                                .foregroundColor(.white)
                                .lineLimit(2)
                                .padding(10)
                                .font(.prentendardMedium13)
                        }
                        .onTapGesture {
                            homeViewModel.photoID = photo.id
                            homeViewModel.title = photo.slug
                            homeViewModel.desc = photo.description ?? ""
                            homeViewModel.photo = photo.urls?.raw ?? ""
                            homeViewModel.popup = true
                            
                            homeViewModel.getDetailInfo(photoID: photo.id)
                        }
                    }
                    
                }
            }
        }
            
    }

    func onAppearClosure(_ photo: Photos) {
        guard let onTileCallback = onTileCallback else {
            return
        }
        onTileCallback(photo)
    }
    
}
