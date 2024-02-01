//
//  CardTView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI
import Kingfisher
//red color #D81D45

struct CardTView: View {
    @ObservedObject var searchObjectManager = SearchObjectManager.shared
    
    var body: some View {
        VStack(spacing: 10) {
            Button {
                print("\(searchObjectManager.randomResults.debugDescription)")
            } label: {
                Text("ddd")
            }
            
//            KFImage(URL(string: searchObjectManager.randomResults?.urls?.raw ?? ""))
            Image("Sample1")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(15)
                        
            HStack {
                Image("x")
                    .padding(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(UIColor.systemGray4), lineWidth: 1))
                    .frame(maxWidth: .infinity)
                Image("Bookmark")
                    .padding(20)
                    .background(Color.main)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .frame(maxWidth: .infinity)
                Image("info")
                    .padding(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(UIColor.systemGray4), lineWidth: 1))
                    .frame(maxWidth: .infinity)
            }
            Spacer().frame(height: 20)
        }
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height * 0.5)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onAppear {
//            searchObjectManager.searchRandomImage()
        }
        
    }
}

#Preview {
    CardTView()
}
