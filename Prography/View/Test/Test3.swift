////
////  Test3.swift
////  Prography
////
////  Created by 박서연 on 2024/02/04.
////
//
//import SwiftUI
//import Kingfisher
//
//struct Test3: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//
////struct StaggeredPhotosView: View {
////    
////    @ObservedObject var homeViewModel: HomeViewModel
////    let photos: [Photos]
////    let onTileCallback: ((Photos) -> Void)?
////    
////    // 추가
////    @State private var loadedPhotos: [[Photos]] = []
////    
////    init(_ pictures: [Photos], onTileAppear: ((Photos) -> Void)? = nil, homeViewModel: HomeViewModel) {
////        self.photos = pictures
////        self.onTileCallback = onTileAppear
////        self.homeViewModel = homeViewModel
////    }
////    
////    private var splitArray: [[Photos]] {
////        var result: [[Photos]] = []
////        
////        var list1: [Photos] = []
////        var list2: [Photos] = []
////        
////        photos.forEach { photo in
////            let index = photos.firstIndex {$0.id == photo.id }
////            
////            if let index = index {
////                if index % 2 == 0  {
////                    list1.append(photo)
////                } else {
////                    list2.append(photo)
////                }
////            }
////        }
////        result.append(list1)
////        result.append(list2)
////        return result
////        
////    }
////    
////    var body: some View {
////        
////        ScrollViewReader { scrollViewProxy in
////            HStack(alignment: .top) {
////                LazyVStack(spacing: 8) {
////                    ForEach(splitArray[0]) { photo in
////                        ZStack(alignment: .bottomLeading) {
////                            KFImage(URL(string: "\(photo.urls?.raw ?? "")"))
////                                .placeholder {
////                                    ProgressView()
////                                }
////                                .resizable()
////                                .aspectRatio(contentMode: .fit)
////                                .clipShape(RoundedRectangle(cornerRadius: 10))
////                            // 여기에서 디테일 통신하기
////                            Text(photo.slug)
////                                .foregroundColor(.white)
////                                .lineLimit(2)
////                                .padding(10)
////                                .font(.prentendardMedium13)
////                        }
////                        .onAppear {
////                            if let lastPhoto = splitArray[0].last, lastPhoto.id == photo.id {
////                                loadMoreData()
////                            }
////                        }
////                    }
////                }
////                
////                LazyVStack(spacing: 8) {
////                    ForEach(splitArray[1]) { photo in
////                        ZStack(alignment: .bottomLeading) {
////                            KFImage(URL(string: "\(photo.urls?.raw ?? "")"))
////                                .placeholder {
////                                    ProgressView()
////                                }
////                                .resizable()
////                                .aspectRatio(contentMode: .fit)
////                                .clipShape(RoundedRectangle(cornerRadius: 10))
////                            // 여기에서 디테일 통신하기
////                            Text(photo.slug)
////                                .foregroundColor(.white)
////                                .lineLimit(2)
////                                .padding(10)
////                                .font(.prentendardMedium13)
////                        }
////                        .onAppear {
////                            // Check if the last item is visible and load more data
////                            if let lastPhoto = splitArray[1].last, lastPhoto.id == photo.id {
////                                loadMoreData()
////                            }
////                        }
////                    }
////                    
////                }
////            }
////            .onChange(of: photos) { newPhotos in
////                // Update loadedPhotos when photos array changes
////                updateLoadedPhotos()
////            }
////                
////        }
////            
////    }
////    
////   
////    func loadInitialData() {
////        // Load initial data (assuming you want to load some data initially)
////        loadedPhotos = splitPhotosArray(photos)
////    }
////    
////    func loadMoreData() {
////        // Simulate loading more data
////        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
////            let newPhotos = homeViewModel.moreData
////            loadedPhotos.append(contentsOf: splitPhotosArray(newPhotos))
////        }
////    }
////    
////    func updateLoadedPhotos() {
////        // Update loadedPhotos when photos array changes
////        loadedPhotos = splitPhotosArray(photos)
////    }
////    
////    func splitPhotosArray(_ photos: [Photos]) -> [[Photos]] {
////        var result: [[Photos]] = []
////        
////        var list1: [Photos] = []
////        var list2: [Photos] = []
////        
////        photos.forEach { photo in
////            let index = photos.firstIndex {$0.id == photo.id }
////            
////            if let index = index {
////                if index % 2 == 0  {
////                    list1.append(photo)
////                } else {
////                    list2.append(photo)
////                }
////            }
////        }
////        result.append(list1)
////        result.append(list2)
////        return result
////    }
////    
////    func onAppearClosure(_ photo: Photos) {
////        guard let onTileCallback = onTileCallback else {
////            return
////        }
////        onTileCallback(photo)
////    }
////    
////}
//
//
//struct StaggeredPhotosView: View {
//    
//    let photos: [Photos]
//    let onTileCallback: ((Photos) -> Void)?
//    
//    
//    init(_ pictures: [Photos], onTileAppear: ((Photos) -> Void)? = nil) {
//        self.photos = pictures
//        self.onTileCallback = onTileAppear
//    }
//    
//    private var splitArray: [[Photos]] {
//        var result: [[Photos]] = []
//        
//        var list1: [Photos] = []
//        var list2: [Photos] = []
//        
//        photos.forEach { photo in
//            let index = photos.firstIndex {$0.id == photo.id }
//            
//            if let index = index {
//                if index % 2 == 0  {
//                    list1.append(photo)
//                } else {
//                    list2.append(photo)
//                }
//            }
//        }
//        result.append(list1)
//        result.append(list2)
//        return result
//        
//    }
//    
//    var body: some View {
//
//        HStack(alignment: .top) {
//            LazyVStack(spacing: 8) {
//                ForEach(splitArray[0]) { photo in
//                    ZStack(alignment: .bottomLeading) {
//                        KFImage(URL(string: "\(photo.urls?.raw ?? "")"))
//                            .placeholder {
//                                ProgressView()
//                            }
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                        // 여기에서 디테일 통신하기
//                        Text(photo.slug)
//                            .foregroundColor(.white)
//                            .lineLimit(2)
//                            .padding(10)
//                            .font(.prentendardMedium13)
//                    }
//                    .onAppear(perform: {onAppearClosure(photo)})
//                }
//            }
//            
//            LazyVStack(spacing: 8) {
//                ForEach(splitArray[1]) { photo in
//                    ZStack(alignment: .bottomLeading) {
//                        KFImage(URL(string: "\(photo.urls?.raw ?? "")"))
//                            .placeholder {
//                                ProgressView()
//                            }
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                        // 여기에서 디테일 통신하기
//                        Text(photo.slug)
//                            .foregroundColor(.white)
//                            .lineLimit(2)
//                            .padding(10)
//                            .font(.prentendardMedium13)
//                    }
//                    .onAppear(perform: {onAppearClosure(photo)})
//                }
//                
//            }
//        }
//    }
//    
//    func onAppearClosure(_ photo: Photos) {
//        guard let onTileCallback = onTileCallback else {
//            return
//        }
//        onTileCallback(photo)
//    }
//    
//}
