//
//  Model.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import Foundation
import SwiftUI

// 랜덤 이미지에서 사용하는 모델
struct RandomResult: Codable, Identifiable {
    let id: String
    let urls: Urls?
    let slug: String
    
    static let emptyData = RandomResult(id: "통신 실패.", urls: nil, slug: "")
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
    let description: String?
    let tags: [Tag]
    let urls: Urls?
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


/*
 struct Photos: Codable, Identifiable, Equatable {
     let id: String
     let slug: String
     let description: String?
     let urls: Urls?
     
     static func == (lhs: Photos, rhs: Photos) -> Bool {
         // Implement the equality check based on your requirements
         return lhs.id == rhs.id // assuming 'id' is the identifier property
     }
 }
 */
