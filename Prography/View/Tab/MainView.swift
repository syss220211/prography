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
//        ZStack {
//            VStack {
//                switch selectedIndex {
//                case 0:
//                    HomeView()
//                default:
//                    RandomCardView()
//                }
//                
//                
//                HStack(spacing: 100) {
//                    Button(action: {
//                        selectedIndex = 0
//                    }, label: {
//                        Image("Home")
//                            .opacity(tabBarViewModel.selected == .home ? 1.0 : 0.5)
//                    })
//                    
//                    Button(action: {
//                        selectedIndex = 1
//                    }, label: {
//                        Image("Bookmark")
//                            .opacity(tabBarViewModel.selected == .card ? 1.0 : 0.5)
//                    })
//                }
//                .frame(maxWidth: .infinity)
//                .frame(height: UIScreen.main.bounds.height * 0.07)
//                .background(.black)
//            }
//        }
    }
}

#Preview {
    MainView()
        .environmentObject(BookmarkManager())
}
