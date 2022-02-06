//
//  MoreWeatherData.swift
//  newWeather
//
//  Created by Artsem Sharubin on 01.02.2022.
//

import Foundation
 
// MARK: - MoreWeatherData
struct MoreWeatherData: Codable {
    let timezone: String
    let hourly: [Hourly]
    let daily: [Daily]
}

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let weather: [WeatherMore]
}


// MARK: - Weather
struct WeatherMore: Codable {
    let icon: String
}

// MARK: - Daily
struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let weather: [WeatherMore]
}

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double
}
 


