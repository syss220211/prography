//
//  Font.swift
//  Prography
//
//  Created by 박서연 on 2024/02/02.
//

import SwiftUI

struct CustomFont {
    static let medium = "Pretendard-Medium"
    static let bold = "Pretendard-Bold"
    static let regular = "Pretendard-Regular.otf"
    static let semiBold = "Pretendard-SemiBold.otf"
    static let thinkRegular = "ThinkRegular"
}

extension Font {
    // Bold
    static let pretendardBold20: Font = .custom(CustomFont.bold, size: 20)
    static let pretendardBold14: Font = .custom(CustomFont.bold, size: 14)
    static let pretendardBold12: Font = .custom(CustomFont.bold, size: 12)
    
    // Medium
    static let prentendardMedium13: Font = .custom(PretendardFont.medium, size: 13)
    static let prentendardMedium15: Font = .custom(PretendardFont.medium, size: 15)
    
    
}
