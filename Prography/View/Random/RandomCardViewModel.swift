//
//  CardSwipeTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI
import Alamofire

enum SwipeDirection {
    case left
    case right
}

final class RandomCardViewModel: ObservableObject {
    @Published var randomImage: [Result] = []
    @Published var backgroundRandomImage: Result?
    @Published var test: [String] = ["Sample1", "Sample2"]
    
    // info를 위해서 테스트중
    @Published var isTapped: Bool = false
    @Published var testRandomInfo: PhotoDetail = .init(id: UUID().uuidString,
                                                       description: "",
                                                       tags: [],
                                                       urls: nil,
                                                       user: .init(username: "nothing"))
    @Published var photoURL: String = ""
    @Published var photoID: String = ""
    @Published var title: String = ""
    
    private let searchManager = SearchObjectManager.shared

    func fetchImageData() {
        (0...1).forEach { _ in
            searchManager.searchRandomImage { result in
                guard let result else { return }
                self.randomImage.append(result)
            }
        }
    }
    
    func fetchBackgroundImage() {
        searchManager.backgroundRandomImage { result in
            guard let result else { return }
            self.backgroundRandomImage = result
        }
    }
    
    // 디테일 정보 태우기
    func testGetRandomInfo(photoID: String) {
        // https://api.unsplash.com/photos/s0A8sa9oasY?client_id=BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s
        // s0A8sa9oasY
        let url = "https://api.unsplash.com/photos/\(photoID)?client_id=BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
        
        AF.request(url).validate().responseDecodable(of: PhotoDetail.self) { response in
            switch response.result {
            case .success(let jsonResult):
                DispatchQueue.main.async {
                    print("🔥Info 함수 성공🔥")
                    self.testRandomInfo = jsonResult
                }
            case .failure(let error):
                print("🥶Info 함수 실패🥶")
                print(error.localizedDescription)
            }
        }
    }
}
