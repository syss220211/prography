//
//  SearchManager.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import Foundation

class SearchObjectManager: ObservableObject {
    static let shared = SearchObjectManager()
    private init() {}
    
    @Published var randomResults = [Result]()
    @Published var photoResults = [Result]()
    @Published var searchText: String = "flowers"
    var accessKey = "BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
    
    func searchRandomImage() {
        // 랜덤 이미지 받아오기 https://api.unsplash.com/photos/random?client_id=YOUR_ACCESS_KEY
        let url = URL(string: "https://api.unsplash.com/photos/random?client_id=\(accessKey)")
        var request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("Random Raw JSON data: \(jsonString)")
//            }
//            
            do {
                let jsonResult = try JSONDecoder().decode(Result.self, from: data)
                
                DispatchQueue.main.async {
                    self.randomResults.append(jsonResult)
                    print("🔥랜덤🔥성공")
                }
                
            } catch {
                print("🥶랜덤🥶실패")
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // 여러장!!!!!!!!!!!!
    func searchPhotos() {
        let url = URL(string: "https://api.unsplash.com/photos?client_id=\(accessKey)")
        var request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
//            if let jsonString = String(data: data, encoding: .utf8) {
//                print("photos Raw JSON data: \(jsonString)")
//            }
            
            do {
                let jsonResult = try JSONDecoder().decode([Result].self, from: data)
                
                DispatchQueue.main.async {
                    self.photoResults.append(contentsOf: jsonResult)
                    print("count: \(jsonResult.count)")
                    print("🔥포토🔥성공")
                }
                
            } catch {
                print("🥶포토🥶실패")
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
