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
    
    private let accessKey = "BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
    
    // MARK: - escaping으로 해보기
    func getDetailPhoto(completion: @escaping([Photos]) -> Void) {
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
    func searchRandomImage(completion: @escaping (RandomResult?) -> Void) {
        let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
        
        AF.request(url).validate().responseDecodable(of: RandomResult.self) { response in
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
    func backgroundRandomImage(completion: @escaping (RandomResult?) -> Void) {
        let url = "https://api.unsplash.com/photos/random?client_id=\(accessKey)"
        
        DispatchQueue.global().async {
            AF.request(url).validate().responseDecodable(of: RandomResult.self) { response in
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
