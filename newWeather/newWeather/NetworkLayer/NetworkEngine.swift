//
//  NetworkEngine.swift
//  newWeather
//
//  Created by Artsem Sharubin on 04.02.2022.
//

import Foundation

class NetworkEngine {

    func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result< T, Error>) -> Void) {
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURl
        components.path = endpoint.path
        components.queryItems = endpoint.parameters

        guard let url = components.url else { return }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in

            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "unknown error")
                return
            }

            guard response != nil, let data = data else { return }

            DispatchQueue.main.async {
                var responseObject: T
                do {
                    responseObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(responseObject))
                } catch {
                    print("error: \(error)")
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
