//
//  HomeBookmarkTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

struct HomeBookmarkTest: View {
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(Sample.data, id: \.self) { data in
                    Image(data.name)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: UIScreen.main.bounds.height * 0.3)
    }
}

#Preview {
    HomeBookmarkTest()
}
