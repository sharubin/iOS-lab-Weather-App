//
//  OneCallEndpoint.swift
//  newWeather
//
//  Created by Artsem Sharubin on 04.02.2022.
//

import Foundation

enum OneCallEndpoint: Endpoint {
    
    case getCurrenWeather(lat: String, lon: String, exclude: String)
    
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
            return "/data/2.5/onecall"
        }
    }
    
    var parameters: [URLQueryItem] {
        let apiKey = "b0809fedc7ea832cdc5cc0f793119331"
        let units = "metric"
        
        switch self {
        case .getCurrenWeather(let lat, let lon, let exclude):
            return [URLQueryItem(name: "lat", value: lat),
                    URLQueryItem(name: "lon", value: lon),
                    URLQueryItem(name: "exclude", value: exclude),
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
