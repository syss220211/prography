//
//  SearchManager.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import Alamofire
import Combine
import SwiftUI

class SearchObjectManager: ObservableObject {
    static let shared = SearchObjectManager()
    private init() {}
    
    @Published var CombineImage: Result?
    @Published var backgroundImage: Result?
    @Published var randomResults: Result? // [Result]?
    @Published var photoResults = [Result]()
    
    // 랜덤포토 추가 테스트
    @Published var randomPhotos = [Result]()
    
    // MARK: - Test
    @Published var backgroundText: String = "second"
    @Published var randomText: String = "first"
    @Published var groupText: [String] = []
    @Published var randomSearchs: Result?
    private var cancellables: Set<AnyCancellable> = []

    var accessKey = "BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
    
    // https://api.unsplash.com/photos/random/?count=30&client_id=BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s
    
    func searchRandomImage() {
        let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: Result.self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    self.randomResults = jsonResult
//                    self.randomResults?.append(jsonResult)
                    print("🔥랜덤🔥성공")
                    print(jsonResult)
                }
            case .failure(let error):
                print("🥶랜덤🥶실패")
                print(error.localizedDescription)
            }
        }
    }
    
    func combineRandomImage() {
            let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
            
            AF.request(url)
                .validate()
                .publishDecodable(type: Result.self)
                .receive(on: DispatchQueue.main) // Ensure UI updates on the main thread
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("🥶랜덤🥶실패")
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] jsonResult in
                    guard let result = jsonResult.value else {
                        // Handle the error case or return if necessary
                        return
                    }
                    
                    print("🔥랜덤🔥성공")
                    print(result)
                    self?.randomSearchs = result
                }
                .store(in: &cancellables)
        }
    
    // 백그라운드 용
    func backgroundRandomImage() {
        let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: Result.self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.global().async {
                    self.backgroundImage = jsonResult
                    // self.randomResults?.append(jsonResult)
                    print("🔥Random🔥Success")
                    print(jsonResult)
                }
            case .failure(let error):
                print("🥶Random🥶Failed")
                print(error.localizedDescription)
            }
        }
    }
    
    
    // Add Random Test
    func randomPhotoAppend() {
        let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: Result.self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
//                    self.randomResults = jsonResult
                    self.randomPhotos.append(jsonResult)
                    print("🔥랜덤🔥성공")
                }
            case .failure(let error):
                print("🥶랜덤🥶실패")
                print(error.localizedDescription)
            }
        }
    }
    
    func searchPhotos() {
        let url = "https://api.unsplash.com/photos?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: [Result].self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    self.photoResults.append(contentsOf: jsonResult)
                    print("count: \(jsonResult.count)")
                    print("🔥포토🔥성공")
                }
            case .failure(let error):
                print("🥶포토🥶실패")
                print(error.localizedDescription)
            }
        }
    }
}

//import Foundation
//
//class SearchObjectManager: ObservableObject {
//    static let shared = SearchObjectManager()
//    private init() {}
//    
//    @Published var randomResults: Result?// [Result]()
//    @Published var photoResults = [Result]()
//    @Published var searchText: String = "flowers"
//    var accessKey = "BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
//    
//    func searchRandomImage() {
//        // 랜덤 이미지 받아오기 https://api.unsplash.com/photos/random?client_id=YOUR_ACCESS_KEY
//        let url = URL(string: "https://api.unsplash.com/photos/random?client_id=\(accessKey)")
//        var request = URLRequest(url: url!)
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else { return }
//            
////            if let jsonString = String(data: data, encoding: .utf8) {
////                print("Random Raw JSON data: \(jsonString)")
////            }
//
//            do {
//                let jsonResult = try JSONDecoder().decode(Result.self, from: data)
//                
//                DispatchQueue.main.async {
//                    self.randomResults = jsonResult
////                    self.randomResults.append(jsonResult)
//                    print("🔥랜덤🔥성공")
//                }
//                
//            } catch {
//                print("🥶랜덤🥶실패")
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//    }
//    
//    // 여러장!!!!!!!!!!!!
//    func searchPhotos() {
//        let url = URL(string: "https://api.unsplash.com/photos?client_id=\(accessKey)")
//        var request = URLRequest(url: url!)
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else { return }
//            
////            if let jsonString = String(data: data, encoding: .utf8) {
////                print("photos Raw JSON data: \(jsonString)")
////            }
//            
//            do {
//                let jsonResult = try JSONDecoder().decode([Result].self, from: data)
//                
//                DispatchQueue.main.async {
//                    self.photoResults.append(contentsOf: jsonResult)
//                    print("count: \(jsonResult.count)")
//                    print("🔥포토🔥성공")
//                }
//                
//            } catch {
//                print("🥶포토🥶실패")
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//    }
//}
