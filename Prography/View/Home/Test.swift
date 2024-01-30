////
////  Test.swift
////  Prography
////
////  Created by 박서연 on 2024/01/30.
////
//
//import SwiftUI
//
//struct Photo: Codable, Identifiable, Hashable {
//    var id: UUID = UUID()
//    let urls: PhotoURLs
//}
//
//struct PhotoURLs: Codable, Identifiable, Hashable {
//    var id: UUID = UUID()
//    let regular: String
//}
//
//struct PhotoListView: View {
//    @State private var photos: [Photo] = []
//
//    var body: some View {
//        NavigationView {
//            List(photos, id: \.self) { photo in
//                AsyncImage(url: URL(string: photo.urls.regular)) { phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                    case .success(let image):
//                        image
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 200)
//                    case .failure:
//                        Image(systemName: "photo")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 200)
//                    @unknown default:
//                        fatalError()
//                    }
//                }
//            }
//            .onAppear(perform: fetchPhotos)
//            .navigationTitle("Unsplash Photos")
//        }
//    }
//
//    func fetchPhotos() {
//        guard let url = URL(string: "https://api.unsplash.com/photos/?client_id=YOUR_UNSPLASH_API_KEY") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let fetchedPhotos = try decoder.decode([Photo].self, from: data)
//                    DispatchQueue.main.async {
//                        self.photos = fetchedPhotos
//                    }
//                } catch {
//                    print("Error decoding JSON: \(error.localizedDescription)")
//                }
//            }
//        }
//
//        task.resume()
//    }
//}
//
//#Preview {
//    PhotoListView()
//}
