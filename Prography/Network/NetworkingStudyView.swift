//
//  NetworkingStudyView.swift
//  Prography
//
//  Created by 박서연 on 2024/05/23.
//

import SwiftUI

struct NetworkingStudyView: View {
    let apiManager = ApiManager()
    @State private var sample: [Photos]?
    @State private var errorMessage: NetworkError?
    
    var body: some View {
        VStack {
            Text("하요")
        }
        .onAppear {
            apiManager.requestApi(apiMethod: .get, endPoint: "") { (result: Result<[Photos], NetworkError>) in
                switch result {
                case .success(let success):
                    self.sample = success
                case .failure(let failure):
                    self.errorMessage = failure
                    print(errorMessage ?? "")
                    print(failure.errorDescrpiton ?? "ddddd")
                }
            }
        }
    }
}

#Preview {
    NetworkingStudyView()
}
