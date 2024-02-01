//
//  TabBarItem.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

enum TabBarItem: CaseIterable {
    case home, card
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
//            HomeView()
            HomeViewTest()
        case .card:
            BookmarkView()
        }
    }
    
    var iconName:String {
        switch self {
        case .home:
            return "Home"
        case .card:
            return "Card"
        }
    }
    
}
