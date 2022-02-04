//
//  WeatherData.swift
//  newWeather
//
//  Created by Artsem Sharubin on 01.02.2022.
//

import Foundation
import UIKit

struct WeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let timezone: Int
    let name: String
    var conditionIcon: UIImage? {
        switch weather.first?.icon {
            case "01d": return UIImage(systemName: "sun.max.fill")
            case "02d": return UIImage(systemName: "cloud.sun.fill")
            case "03d": return UIImage(systemName: "cloud")
            case "04d": return UIImage(systemName: "cloud.fill")
            case "09d": return UIImage(systemName: "cloud.heavyrain.fill")
            case "10d": return UIImage(systemName: "sun.dust.fill")
            case "11d": return UIImage(systemName: "cloud.bolt.fill")
            case "13d": return UIImage(systemName: "snowflake")
            case "50d": return UIImage(systemName: "cloud.fog")
        default:
            return nil
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
    let weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
