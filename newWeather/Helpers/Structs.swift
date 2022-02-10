//
//  Structs.swift
//  newWeather
//
//  Created by Artsem Sharubin on 09.02.2022.
//

import Foundation
import UIKit

struct Titles {
    static let minTemp = "min temp"
    static let maxTemp = "max temp"
    static let feelsLike = "feels like"
    static let pressure = "pressure"
    static let humidity = "humidity"
    static let visibility = "visibility"
    static let windSpeed = "wind speed"
    static let windDirection = "wind direction"
    
    static let EnterTheCity = "Enter the city"
    static let GetTheWeather = "Get the weather"
}

struct Colors {
    static let badWeatherColor = UIColor(red: 119/255.0, green: 139/255.0, blue: 158/255.0, alpha: 1.0)
    static let badWeatherColorCells = UIColor(red: 86/255.0, green: 113/255.0, blue: 135/255.0, alpha: 1.0)
    static let goodWeatherColor = UIColor(red: 59/255.0, green: 143/255.0, blue: 195/255.0, alpha: 1.0)
    static let goodWeatherColorCells = UIColor(red: 26/255.0, green: 130/255.0, blue: 196/255.0, alpha: 1.0)
    static let whiteColor = UIColor.white
}

struct Fonts {
    static let mainFontForDetailScreen = UIFont(name: "Copperplate", size: 30)
    static let fontForDetailScreen = UIFont(name: "Copperplate", size: 17)
    static let lightFontForDaily = UIFont(name: "Copperplate-Light", size: 17)
    static let boldFontForDaily = UIFont(name: "Copperplate-Bold", size: 17)
}

