//
//  Test.swift
//  Prography
//
//  Created by 박서연 on 2024/02/03.
//

import SwiftUI

struct Test: View {
    let number = ["one", "two", "three", "four"]
    
    var body: some View {
        VStack {
            ForEach(number, id: \.self) { index in
                Text(index)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .foregroundColor(.red)
            }
            
        }
    }
}

#Preview {
    Test()
}
