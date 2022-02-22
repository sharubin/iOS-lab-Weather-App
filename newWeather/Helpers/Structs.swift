//
//  Structs.swift
//  newWeather
//
//  Created by Artsem Sharubin on 09.02.2022.
//

import UIKit

struct Strings {
    
    struct CityView {
        static let placeholderText = "Enter the city"
        static let buttonText = "Get the weather"
        static let error = "Ошибка"
        static let okString = "OK"
        static let emptyText = "Город не введен"
        static let noData = "Город введен не корректно, данные отсутсвуют"
        static let buttonFavourite = "To Favourites"
        static let toMapButton = "To Map"
    }
    
    struct DetailView {
        static let minTemp = "min temp"
        static let maxTemp = "max temp"
        static let feelsLike = "feels like"
        static let pressure = "pressure"
        static let humidity = "humidity"
        static let visibility = "visibility"
        static let windSpeed = "wind speed"
        static let windDirection = "wind direction"
        static let textButton = "load more"
        static let celsium = "%.0f °С"
        static let mmHg = "%.0f mm Hg"
        static let percent = "%.0d pct"
        static let speedMS = "%.0f m/c"
        static let meters = "%.0d m"
        static let minMaxTemp = "min.: %.0f°, max.: %.0f°"
        static let addFv = "add fv"
        static let removeFv = "remove fv"
    }
    
    struct FavouriteView {
        static let header = "Favourite cities"
        static let delete = "Delete"
        static let error = "print error"
    }
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

struct Keys {
    static let googleKey = "AIzaSyCs7j4Ngv12hif30OndDfzpmqCKXkYDsAY"
    static let apiKey = "b0809fedc7ea832cdc5cc0f793119331"
}

