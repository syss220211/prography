//
//  APITest.swift
//  Prography
//
//  Created by 박서연 on 2024/01/30.
//

import SwiftUI
import WaterfallGrid
import Kingfisher

class ApiTestViewModel: ObservableObject {
    private let searchManager = SearchObjectManager.shared
    
    @Published var testDetailPhoto: [Photos] = []
    
    func fetchTestDetailPhotos() {
        searchManager.testEscapingGetDetailPhoto { photos in
            self.testDetailPhoto = photos
        }
    }
    
}

struct APITest: View {
    @StateObject var testViewModel = ApiTestViewModel()
    
    var body: some View {
        VStack {
            Button {
                // testViewModel.fetchTestDetailPhotos()
            } label: {
                Text("통신 태우기")
            }
            
            List (testViewModel.testDetailPhoto, id: \.id) { data in
                if let url = data.urls {
                    VStack(alignment: .leading) {
                        Text("id값: \(data.id)")
                        KFImage(URL(string: url.raw))
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFit()
                        Text("제목 : \(data.slug)")
                        Text("설명 : \(data.description ?? "")")
                            .lineLimit(2)
                    }
                } else {
                    Text("통신에 실패했습니다.")
                }
            }
        }
    }
}

#Preview {
    APITest()
}
