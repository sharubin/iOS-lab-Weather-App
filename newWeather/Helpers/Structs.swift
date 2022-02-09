//
//  Structs.swift
//  newWeather
//
//  Created by Artsem Sharubin on 09.02.2022.
//

import Foundation
import UIKit

struct Titles {
    let minTemp = "min temp"
    let maxTemp = "max temp"
    let feelsLike = "feels like"
    let pressure = "pressure"
    let humidity = "humidity"
    let visibility = "visibility"
    let windSpeed = "wind speed"
    let windDirection = "wind direction"
}

struct Colors {
    let badWeatherColor = UIColor(red: 119/255.0, green: 139/255.0, blue: 158/255.0, alpha: 1.0)
    let badWeatherColorCells = UIColor(red: 86/255.0, green: 113/255.0, blue: 135/255.0, alpha: 1.0)
    
    let goodWeatherColor = UIColor(red: 59/255.0, green: 143/255.0, blue: 195/255.0, alpha: 1.0)
    let goodWeatherColorCells = UIColor(red: 26/255.0, green: 130/255.0, blue: 196/255.0, alpha: 1.0)
    
}

struct Fonts {
    let mainFontForDetailScreen = UIFont(name: "Copperplate", size: 30)
    let fontForDetailScreen = UIFont(name: "Copperplate", size: 17)
    let lightFontForDaily = UIFont(name: "Copperplate-Light", size: 17)
    let boldFontForDaily = UIFont(name: "Copperplate-Bold", size: 17)
}

