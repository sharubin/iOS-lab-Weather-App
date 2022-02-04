//
//  MoreWeatherData.swift
//  newWeather
//
//  Created by Artsem Sharubin on 01.02.2022.
//

import Foundation
import UIKit

 
// MARK: - MoreWeatherData
struct MoreWeatherData: Codable {
    let timezone: String?
    let hourly: [Hourly]?
    let daily: [Daily]?
    var hourlyConditionIcon: UIImage? {
        switch hourly?.first?.weather.first?.icon {
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
    var dailyConditionIcon: UIImage? {
        switch daily?.first?.weather.first?.icon {
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

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let weather: [WeatherMore]
}


// MARK: - Weather
struct WeatherMore: Codable {
   // let icon: Icon
    let icon: String
}

enum Icon: String, Codable {
    case the04D = "04d"
    case the04N = "04n"
    case the13D = "13d"
    case the13N = "13n"
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
 


