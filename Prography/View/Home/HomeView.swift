//
//  HomeView.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI

struct HomeView: View {
    var bookmark: Bool = false
    var sample: [String] = ["Sample1", "Sample2", "Sample3", "Sample4"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("북마크")
                Text("최신이미지")
                LazyVGrid(columns: [GridItem](repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 10) {
                    ForEach(sample, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: (UIScreen.main.bounds.width/2) - 20)
                            .clipped()
                            .cornerRadius(4)
                    }
                }
                .padding(.horizontal, 20)
                 
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                }
            }
        }
    }
}

struct hasBookmarkView: View {
    var body: some View {
        VStack {
            Text("북마크")
                .font(.custom(PretendardFont.bold, size: 20))
            
            Text("최신이미지")
                .font(.custom(PretendardFont.bold, size: 20))
        }
    }
}

#Preview {
    HomeView()
}
