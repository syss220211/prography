//
//  ApiManagerAsync.swift
//  Prography
//
//  Created by 박서연 on 2024/05/23.
//

import Foundation

class ApiManagerAsync {
    func requestApiAsync<T: Decodable>(
        apiMethod: ApiMethod,
        endPoint: String,
        queryParameter: [String: String]? = nil
    ) async -> Result<T, NetworkError> {
        
        let urlComponents = URLComponents(string: "\(BaseURL.baseUrl)\(endPoint)")
        guard var urlComponent = urlComponents else {
            return .failure(.urlError)
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
            return .failure(.nilError)
        }
        
        do {
            let (data, response) = try await session.data(for: URLRequest(url: requestURL))
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(.nilError)
            }
            
            guard (200...299).contains(response.statusCode) else {
                return .failure(.responseError(response.statusCode))
            }
            
            // (return .success(data as! T)) 말고 여기서 미리 데이터 타입 지정
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                return .success(data)
            } catch {
                print(error.localizedDescription)
                return .failure(.parsingError)
            }
        } catch {
            print(error.localizedDescription)
            return .failure(.apiError)
        }
    }
}

