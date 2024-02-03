//
//  UserDefaultTest1.swift
//  Prography
//
//  Created by 박서연 on 2024/02/03.
//

import SwiftUI

struct UserDefaultTest1: View {

    @State private var userDefaultString: [String] = UserDefaults.standard.stringArray(forKey: "PhotosID") ?? []
    
    
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Text("저장하기")
            }
            
            
        }
    }
}

#Preview {
    UserDefaultTest1()
}
