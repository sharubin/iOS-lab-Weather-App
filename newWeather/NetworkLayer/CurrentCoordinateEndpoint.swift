//
//  CurrentCoordinateEndpoint.swift
//  newWeather
//
//  Created by Artsem Sharubin on 21.02.2022.
//

import Foundation

enum CurrentCoordinateEndpoint: Endpoint {
    
    case getCurrenWeather(lat: String, lon: String)
    
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
        let apiKey = Keys.apiKey
        let units = "metric"
        
        switch self {
        case .getCurrenWeather(let lat, let lon):
            return [URLQueryItem(name: "lat", value: lat),
                    URLQueryItem(name: "lon", value: lon),
                    URLQueryItem(name: "units", value: units),
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
