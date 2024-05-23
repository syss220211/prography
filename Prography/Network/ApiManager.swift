//
//  ApiManager.swift
//  Prography
//
//  Created by 박서연 on 2024/05/23.
//

import Foundation

struct BaseURL {
    static let baseUrl: String = "https://api.unsplash.com/photos"
    static let clientID: String = "BYmNhE5R5j3AcWPs3V5U3_RGnR-XL7fqkuJqmrEfV3s"
}
enum ApiMethod: String {
    case get = "GET"
}

enum NetworkError: Error {
    case serverError
    case parsingError
    case apiError
    case urlError
    case typeError
    case responseError(Int)
    case nilError
}

extension NetworkError {
    var errorDescrpiton: String? {
        switch self {
        case .serverError:
            return "Server Error"
        case .parsingError:
            return "Parsing Error"
        case .apiError:
            return "API Error"
        case .urlError:
            return "URL Error"
        case .typeError:
            return "Mime type Error"
        case .responseError(let statusCode):
            return "Reponse Error 상태코드: \(statusCode)"
        case .nilError:
            return "Nil Error"
        }
    }
}

class ApiManager {
    func requestApi<T: Decodable>(
        apiMethod: ApiMethod,
        endPoint: String,
        queryParameter: [String: String]? = nil,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        
        let urls = URL(string: "\(BaseURL.baseUrl)\(endPoint)")

        guard let url = urls else {
            completion(.failure(.urlError))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = [
            "Authorization" : "Client-ID \(BaseURL.clientID)",
            "Accept" : "application/json"
        ]
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(.apiError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.nilError))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.responseError(httpResponse.statusCode)))
                return
            }
            
            // 응답의 content-type을 확인하기 (요청에 대한 확실한 보장이 없어서 한번 더 해줘서 나쁠건 없음)
//            guard let mimeType = httpResponse.mimeType,
//                  mimeType == "application/json",
//                  let data = data else {
//                completion(.failure(.typeError))
//                return
//            }
            
            guard let data = data else {
                completion(.failure(.typeError))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.parsingError))
            }
        }
        task.resume()
    }
}

//        let urlComponents = URLComponents(string: "\(BaseURL.baseUrl)\(endPoint)")
//        guard let urlComponent = urlComponents else {
//            completion(.failure(.urlError))
//            return
//        }