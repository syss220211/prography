//
//  Test2.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import WaterfallGrid

struct Sample: Hashable {
    let name: String
    let descritpion: String
    
    static let data: [Sample] = [Sample(name: "Sample1", descritpion: "a man standing in a canyon with the sun shining through the rocks"),
                                     Sample(name: "Sample2", descritpion: "a kitchen with a sink and a window"),
                                     Sample(name: "Sample3", descritpion: "a lone sailboat in the middle of the ocean"),
                                     Sample(name: "Sample4", descritpion: "an image of a star cluster in the sky")]
}

struct Test2: View {
    let index: [String] = ["Sample1", "Sample2", "Sample3", "Sample4"]
    
    let data: [Sample] = [Sample(name: "Sample1", descritpion: "a man standing in a canyon with the sun shining through the rocks"),
                          Sample(name: "Sample2", descritpion: "a kitchen with a sink and a window"),
                          Sample(name: "Sample3", descritpion: "a lone sailboat in the middle of the ocean"),
                          Sample(name: "Sample4", descritpion: "an image of a star cluster in the sky")]

    
    var body: some View {
        ScrollView {
            WaterfallGrid(data, id: \.self) { index in
                ZStack(alignment: .bottom) {
                  Image(index.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                  
                  Text(index.descritpion)
                      .foregroundColor(.white)
                      .lineLimit(2)
                      .padding(10)
                      .font(.custom(PretendardFont.medium, size: 13))
              }
            }
        }.padding(.horizontal, 15)

    }
}

#Preview {
    Test2()
}
