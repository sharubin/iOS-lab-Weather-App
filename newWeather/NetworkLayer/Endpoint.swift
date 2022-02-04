//
//  Endpoint.swift
//  newWeather
//
//  Created by Artsem Sharubin on 04.02.2022.
//

import Foundation

protocol Endpoint {
    //HTTP or HTTPS
    var scheme: String { get }
    
    //example: "openweathermap.org"
    var baseURl: String { get }
    
    // "/api/one-call-api"
    var path: String { get }
    
    // [URLQueryItem(name: "api_key", value: API_KEY)] -  может быть пустым, если не требуется
    var parameters: [URLQueryItem] { get }
    
    // "GET"
    var method: String { get }
}
