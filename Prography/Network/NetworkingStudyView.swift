//
//  NetworkingStudyView.swift
//  Prography
//
//  Created by 박서연 on 2024/05/23.
//

import SwiftUI
import Kingfisher

struct NetworkingStudyView: View {
    let apiManager = ApiManagerHeader()
//    let apiManager = ApiManagerURLSessionConfiguration()
    @State private var sample: [Photos] = []
    @State private var errorMessage: NetworkError?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(sample, id: \.id) { photo in
                    Text("ID: \(photo.id)")
                    
                    if let url = photo.urls?.raw {
                        let urls = URL(string: url)
                        
                        KFImage(urls)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }

                }
            }
        }
        .onAppear {
//            apiManager.requestApi(apiMethod: .get, endPoint: "") { (result: Result<[Photos], NetworkError>) in
//                switch result {
//                case .success(let success):
//                    self.sample = success
//                case .failure(let failure):
//                    self.errorMessage = failure
//                    print(errorMessage ?? "")
//                    print(failure.errorDescrpiton ?? "ddddd")
//                }
//            }
//            apiManager.requestApi(apiMethod: .get, endPoint: "") { (result: Result<[Photos], NetworkError>) in
//                switch result {
//                case .success(let success):
//                    self.sample = success
//                case .failure(let failure):
//                    self.errorMessage = failure
//                    print(errorMessage ?? "")
//                    print(failure.errorDescrpiton ?? "ddddd")
//                }
//            }
        }
//        .task {
//            let result: Result<[Photos], NetworkError> = await apiManager.requestApiAsync(apiMethod: .get, endPoint: "")
//            
//            switch result {
//            case .success(let success):
//                self.sample = success
//            case .failure(let failure):
//                self.errorMessage = failure
//                print(errorMessage ?? "")
//            }
//        }
    }
}

#Preview {
    NetworkingStudyView()
}
