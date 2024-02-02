//
//  Model.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import Foundation
import SwiftUI

// 랜덤 이미지에서 사용하는 모델
struct Result: Codable, Identifiable {
    let id: String
    let urls: Urls?
    
    static let emptyData = Result(id: "통신 실패.", urls: nil)
}

// 홈뷰에서 최신 이미지 불러올때 사용하는 모델
struct Photos: Codable, Identifiable {
    let id: String
    let slug: String
    let description: String?
    let urls: Urls?
}

// 사진 디테일을 볼때 사용하는 모델
struct PhotoDetail: Codable, Identifiable {
    let id: String
    let tags: [Tag]
    let user: User
}

struct Tag: Codable, Hashable {
    let title: String
}

struct User: Codable {
    let username: String
}

struct Urls: Codable {
    let raw, full, thumb, regular: String
    let small: String
}
