//
//  MainView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

class ZIndexManager: ObservableObject {
    @Published var index: Int = 1
}

struct MainView: View {
    @StateObject private var tabBarViewModel = TabBarViewModel()
    @StateObject private var zIndex = ZIndexManager()
    @EnvironmentObject var bookmarkManager: BookmarkManager
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CustomTabView(tabBarViewModel: tabBarViewModel)
                .zIndex(Double(zIndex.index))

            TabView(selection: $tabBarViewModel.selected) {
                ForEach(TabBarItem.allCases, id: \.self) { tab in
                    tab.view
                        .environmentObject(bookmarkManager)
                        .environmentObject(zIndex)
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(BookmarkManager())
}
