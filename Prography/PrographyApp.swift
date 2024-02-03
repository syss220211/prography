//
//  PrographyApp.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

@main
struct PrographyApp: App {
    @StateObject var bookmarkManager = BookmarkManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(bookmarkManager)
        }
    }
}
