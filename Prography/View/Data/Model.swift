//
//  Model.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import Foundation
import SwiftUI

struct Result: Codable, Identifiable {
    var id: String
    var urls: Urls?
    
    static let emptyData = Result(id: "통신 실패.", urls: nil)
}

struct Photos: Codable, Identifiable {
    var id: String
    var slug: String
    var description: String?
    var urls: Urls?
}

struct Urls: Codable {
    let raw, full, thumb, regular: String
    let small: String
}
