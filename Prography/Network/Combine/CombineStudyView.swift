//
//  CombineStudyView.swift
//  Prography
//
//  Created by 박서연 on 2024/05/31.
//

import SwiftUI
import Combine
import Kingfisher

class CombineStudyViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var photos: [Photos] = []
    private var cancellables = Set<AnyCancellable>()
    private let apiManager = ApiManagerCombine()
    
    @MainActor
    func fetchApi() {
        apiManager.requestApiAsync(apiMethod: .get, endPoint: "")
            .sink { result in
                switch result {
                case .finished:
                    self.isLoading = false
                    break
                case .failure(let error):
                    print("error 발생! \(error)")
                }
            } receiveValue: { [weak self] (photos: [Photos]) in
                self?.photos = photos
            }
            .store(in: &cancellables)

    }
    
}

struct CombineStudyView: View {
    @ObservedObject var viewModel = CombineStudyViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(viewModel.photos, id: \.id) { photo in
                        Text("ID: \(photo.id)")
                        if let url = photo.urls?.raw {
                            let urls = URL(string: url)
                            
                            KFImage(urls)
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }

                    }
                }
                
            }
        }
        .onAppear {
//            viewModel.fetchApi()
        }
    }
}

#Preview {
    CombineStudyView()
}
