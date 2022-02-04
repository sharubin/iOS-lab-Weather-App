//
//  OpenweatherEndpoint.swift
//  newWeather
//
//  Created by Artsem Sharubin on 04.02.2022.
//

import Foundation

enum CurrentEndpoint: Endpoint {
    
case getCurrenWeather(city: String)
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURl: String {
        switch self {
        default:
            return "api.openweathermap.org"
        }
    }
    
    var path: String {
        switch self {
        case .getCurrenWeather:
            return "/data/2.5/weather"
        }
    }
    
    var parameters: [URLQueryItem] {
        let apiKey = "b0809fedc7ea832cdc5cc0f793119331"
        
        switch self {
        case .getCurrenWeather(let city):
            return [URLQueryItem(name: "q", value: city),
                    URLQueryItem(name: "appid", value: apiKey)
            ]
        }
    }
    
    var method: String {
        switch self {
        case .getCurrenWeather:
            return "GET"
        }
    }
    
}
