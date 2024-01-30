////
////  ContentView.swift
////  Prography
////
////  Created by 박서연 on 2024/01/30.
////
//
//import SwiftUI
//import Kingfisher
//import LazyCollectionView
//
//struct YourCustomLayout: LazyCollectionLayout {
//    // Implement the required methods
//    // ...
//}
//
//struct YourItemView: View {
//    var body: some View {
//        // Implement your custom item view
//        // Use AsyncImage to load the image from the URL
//    }
//
//    func configure(with result: Result) {
//        // Configure your item view based on the result
//        // Load the image using AsyncImage
//    }
//}
//struct ContentView: View {
//    @StateObject private var layout = MyCustomLayout() // Assuming you have a custom layout
//    @ObservedObject var searchObjectManager = SearchObjectManager.shared
//    
//    let data: [String] = ["Item 1", "Item 2", "Item 3", "Item 4"] // Replace this with your actual data
//
//    var body: some View {
//        LazyCollectionView(data: searchObjectManager.photoResults, layout: layout) { item in
//            KFImage(URL(string: item.urls?.raw ?? ""))
//                .resizable()
//                .scaledToFit()
//        }
//        .onAppear {
//            searchObjectManager.searchRandomImage()
//            searchObjectManager.searchPhotos()
//        }
//    }
//}
//
//class MyCustomLayout: LazyCollectionLayout {
//    @Published var contentSize: CGSize = .zero
//
//    func setParentSize(_ parentSize: CGSize) {
//        // Handle parent size changes, if needed
//    }
//
//    func prepare<Data>(withData data: Data) where Data: RandomAccessCollection & Equatable,
//                                                   Data.Index == Int,
//                                                   Data.Element: Identifiable {
//        // Calculate content size based on your data and layout logic
//        contentSize = CGSize(width: 300, height: 300)
//    }
//
//    func layoutAttributesForElements(in rect: CGRect) -> [LazyCollectionLayoutAttributes] {
//        // Calculate and return layout attributes for elements within the specified rectangle
//        // You'll need to implement this based on your custom layout logic
//        return []
//    }
//}
//
//#Preview {
//    ContentView()
//}
