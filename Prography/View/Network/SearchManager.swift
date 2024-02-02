//
//  SearchManager.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import Alamofire
import Combine
import SwiftUI



final class SearchObjectManager {
    static let shared = SearchObjectManager()
    private init() {}
    
    @Published var photoResults = [Result]() //이거

    private let accessKey = "BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
    
    // https://api.unsplash.com/photos/random/?count=30&client_id=BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s
    
    // MARK: - 첫번째 탭바용 함수
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
    
    // escaping으로 해보기
    func testEscapingGetDetailPhoto(completion: @escaping([Photos]) -> Void) {
        let url = "https://api.unsplash.com/photos?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: [Photos].self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    print("🔥디테일 함수 성공🔥")
                    completion(jsonResult)
                }
            case .failure(let error):
                print("🥶디테일 함수 실패🥶")
                print(error.localizedDescription)
            }
        }
    }
    // MARK: - 두번째 탭바용 함수
    /// 랜덤 사진 한 장 가져오는 함수
    func searchRandomImage(completion: @escaping (Result?) -> Void) {
        let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: Result.self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    completion(jsonResult)
                }
            case .failure(let error):
                completion(nil)
                print(error.localizedDescription)
            }
        }
    }
    
    /// 무한 스크롤을 위해 뒤어서 도는 함수
    func backgroundRandomImage(completion: @escaping (Result?) -> Void) {
        let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
        
        DispatchQueue.global().async {
            AF.request(url).validate().responseDecodable(of: Result.self) { response in
                switch response.result {
                case .success(let jsonResult):
                    completion(jsonResult)
                case .failure(let error):
                    completion(nil)
                    print(error.localizedDescription)
                }
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
