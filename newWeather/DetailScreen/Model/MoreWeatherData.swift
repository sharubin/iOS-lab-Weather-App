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

    func getLink() -> URL? {
        URL(string: "https://openweathermap.org/img/wn/\(weather[0].icon)@2x.png")
    }

    public func getTimeForDate() -> String {
        let inputDate = Date(timeIntervalSince1970: Double(dt))
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: inputDate)
    }
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

    func getLink() -> URL? {
        URL(string: "https://openweathermap.org/img/wn/\(weather[0].icon)@2x.png")
    }

    public func getDayForDate() -> String {
        let inputDate = Date(timeIntervalSince1970: Double(dt))
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
}

// MARK: - Temp
struct Temp: Codable {
    let min, max: Double
}
