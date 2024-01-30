//
//  MainView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

struct MainView: View {
    @StateObject private var tabBarViewModel = TabBarViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabBarViewModel.selected) {
                ForEach(TabBarItem.allCases, id: \.self) { tab in
                    tab.view
                }
            }
            CustomTabView(tabBarViewModel: tabBarViewModel)
        }
    }
}

#Preview {
    MainView()
}
