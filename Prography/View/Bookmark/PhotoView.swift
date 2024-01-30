//
//  PhotoView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import WaterfallGrid

struct PhotoView: View {
    var body: some View {
        Text("최신이미지뷰")
//        ScrollView {
//            WaterfallGrid(data, id: \.self) { index in
//                ZStack(alignment: .bottom) {
//                    Image(index.name)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                    
//                    Text(index.descritpion)
//                        .foregroundColor(.white)
//                        .lineLimit(2)
//                        .padding(10)
//                        .font(.custom(PretendardFont.medium, size: 13))
//                }
//            }
//        }
    }
}

#Preview {
    PhotoView()
}
