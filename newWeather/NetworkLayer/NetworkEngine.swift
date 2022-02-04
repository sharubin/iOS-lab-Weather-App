//
//  NetworkEngine.swift
//  newWeather
//
//  Created by Artsem Sharubin on 04.02.2022.
//

import Foundation

class NetworkEngine {
    //выполняет веб запрос и декодирует ответ json в предоставленный кодируемый объект (структура WeatherData)
    // - Параметры:
    // - endpoints: the endpoint to make the HTTP request against
    // - the JSON response converted to the provided Codable object, if succeseful or failure
    
    
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result< T,Error>) -> Void) {
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
            
    
            var responseObject: T
            do {
                responseObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(responseObject))
            }
            catch {
                print("error: \(error)")
                completion(.failure(error))
            }
            /*
           DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "failed to decode response"])
                
                    completion(.failure(error))
                }
            } */
        }
        dataTask.resume()
    }
}
