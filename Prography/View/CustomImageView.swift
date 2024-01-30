//
//  Extension.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//
import SwiftUI

struct ImageView: View {
    let imageURLString: String

    var body: some View {
        AsyncImage(url: URL(string: imageURLString)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            @unknown default:
                fatalError()
            }
        }
    }
}
