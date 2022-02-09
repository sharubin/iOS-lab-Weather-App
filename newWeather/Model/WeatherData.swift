//
//  WeatherData.swift
//  newWeather
//
//  Created by Artsem Sharubin on 01.02.2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct WeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let timezone: Int
    let name: String
    
    
    public func getDirectionForDegree() -> String {
        switch wind.deg {
        case 337...360:
            return "N"
        case 0...22:
            return "N"
        case 23...67:
            return "NE"
        case 68...112:
            return "E"
        case 113...157:
            return "ES"
        case 158...202:
            return "S"
        case 203...247:
            return "WS"
        case 248...292:
            return "W"
        case 293...336:
            return "W"
        default:
            return "mistake"
        }
    }
    
    public func getBackgroundColor() -> UIColor {
        switch weather.first!.id {
        case 200...499, 502...531, 701...781, 802...804, 600...622:
            return UIColor(red: 119/255.0, green: 139/255.0, blue: 158/255.0, alpha: 1.0)
        case 800...801, 500...501:
            return UIColor(red: 59/255.0, green: 143/255.0, blue: 195/255.0, alpha: 1.0)
        default:
            return .white
        }
    }
    
    public func getCellsBackgroundColor() -> UIColor {
        switch weather.first!.id {
        case 200...499, 502...531, 701...781, 802...804, 600...622:
            return UIColor(red: 86/255.0, green: 113/255.0, blue: 135/255.0, alpha: 1.0)
        case 800...801, 500...501:
            return UIColor(red: 26/255.0, green: 130/255.0, blue: 196/255.0, alpha: 1.0)
        default:
            return .white
        }
    }
    
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}



// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
        case id
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
