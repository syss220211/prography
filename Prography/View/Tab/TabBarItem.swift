//
//  TabBarItem.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

enum TabBarItem: CaseIterable {
    case home, bookmark
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
//            HomeView()
            HomeViewTest()
        case .bookmark:
            BookmarkView()
        }
    }
    
    var iconName:String {
        switch self {
        case .home:
            return "Home"
        case .bookmark:
            return "Bookmark"
        }
    }
    
}
