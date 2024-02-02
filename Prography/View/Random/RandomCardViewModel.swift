//
//  CardSwipeTest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI

enum SwipeDirection {
    case left
    case right
}

final class RandomCardViewModel: ObservableObject {
    @Published var randomImage: [Result] = []
    @Published var backgroundRandomImage: Result?
    @Published var test: [String] = ["Sample1", "Sample2"]
    
    private let searchManager = SearchObjectManager.shared

    func fetchImageData() {
        (0...1).forEach { _ in
            searchManager.searchRandomImage { result in
                guard let result else { return }
                self.randomImage.append(result)
            }
        }
    }
    
    func fetchBackgroundImage() {
        searchManager.backgroundRandomImage { result in
            guard let result else { return }
            self.backgroundRandomImage = result
        }
    }
}
