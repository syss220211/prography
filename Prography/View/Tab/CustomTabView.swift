//
//  CustomTabView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

final class TabBarViewModel: ObservableObject {
    @Published var selected: TabBarItem = .home
}

struct CustomTabView: View {
    @ObservedObject var tabBarViewModel: TabBarViewModel
    @State private var interval: CGFloat = 0
    
    var body: some View {
        HStack(spacing: 100) {
            Button(action: {
                tabBarViewModel.selected = .home
            }, label: {
                Image("Home")
                    .opacity(tabBarViewModel.selected == .home ? 1.0 : 0.5)
            })
            
            Button(action: {
                tabBarViewModel.selected = .card
            }, label: {
                Image("BookmarkB")
                    .opacity(tabBarViewModel.selected == .card ? 1.0 : 0.5)
            })
        }
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height * 0.07)
        .background(.black)
    }
}
