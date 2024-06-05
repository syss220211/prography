//
//  ApiManagerCombine.swift
//  Prography
//
//  Created by 박서연 on 2024/05/31.
//

import Foundation
import Combine

class ApiManagerCombine {
    func requestApiAsync<T: Decodable>(
        apiMethod: ApiMethod,
        endPoint: String,
        queryParameter: [String: String]? = nil
    ) -> AnyPublisher<T, NetworkError> {
        
        let urlComponents = URLComponents(string: "\(BaseURL.baseUrl)\(endPoint)")
        guard var urlComponent = urlComponents else {
            return Fail(error: .urlError).eraseToAnyPublisher()
        }
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Authorization" : "Client-ID \(BaseURL.clientID)",
            "Accept" : "application/json"
        ]

        let session = URLSession(configuration: config)
        
        if let queryParameter = queryParameter {
            let queryItem = queryParameter.map { dictionary in
                URLQueryItem(name: dictionary.key, value: dictionary.value)
            }
            urlComponent.queryItems = queryItem
        }
        
        guard let requestURL = urlComponent.url else {
            return Fail(error: .urlError).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: requestURL)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.nilError
                }
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.responseError(httpResponse.statusCode)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let networkError = error as? NetworkError {
                    return networkError
                } else {
                    return NetworkError.parsingError
                }
            }
            .eraseToAnyPublisher()
    }
}

