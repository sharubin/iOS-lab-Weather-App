//
//  Structs.swift
//  newWeather
//
//  Created by Artsem Sharubin on 09.02.2022.
//

import UIKit

struct Strings {

    struct CityView {
        static let placeholderText = "Enter the city".localizedLanguage()
        static let buttonText = "Get the weather".localizedLanguage()
        static let error = "error".localizedLanguage()
        static let okString = "OK"
        static let emptyText = "The textfield is empty".localizedLanguage()
        static let noData = "The city was entered incorrectly, there is no data".localizedLanguage()
        static let buttonFavourite = "To Favourites".localizedLanguage()
        static let toMapButton = "To Map".localizedLanguage()
    }

    struct DetailView {
        static let minTemp = "min temp".localizedLanguage()
        static let maxTemp = "max temp".localizedLanguage()
        static let feelsLike = "feels like".localizedLanguage()
        static let pressure = "pressure".localizedLanguage()
        static let humidity = "humidity".localizedLanguage()
        static let visibility = "visibility".localizedLanguage()
        static let windSpeed = "wind speed".localizedLanguage()
        static let windDirection = "wind direction".localizedLanguage()
        static let textButton = "load more".localizedLanguage()
        static let celsium = "%.0f °С"
        static let mmHg = "%.0f mm Hg".localizedLanguage()
        static let percent = "%.0d pct".localizedLanguage()
        static let speedMS = "%.0f m/c".localizedLanguage()
        static let meters = "%.0d m".localizedLanguage()
        static let minMaxTemp = "min.: %.0f°, max.: %.0f°".localizedLanguage()
        static let addFv = "add fv".localizedLanguage()
        static let removeFv = "remove fv".localizedLanguage()
    }

    struct FavouriteView {
        static let header = "Favourite cities".localizedLanguage()
        static let delete = "Delete".localizedLanguage()
        static let error = "print error".localizedLanguage()
    }

    struct MapView {
        static let minMaxTemp = "min.: %.0f°, max.: %.0f°".localizedLanguage()
    }
}

struct Colors {
    static let badWeatherColor = UIColor(red: 119/255.0, green: 139/255.0, blue: 158/255.0, alpha: 1.0)
    static let badWeatherColorCells = UIColor(red: 86/255.0, green: 113/255.0, blue: 135/255.0, alpha: 1.0)
    static let goodWeatherColor = UIColor(red: 59/255.0, green: 143/255.0, blue: 195/255.0, alpha: 1.0)
    static let goodWeatherColorCells = UIColor(red: 26/255.0, green: 130/255.0, blue: 196/255.0, alpha: 1.0)
    static let whiteColor = UIColor.white
    static let blackColor = UIColor.black
}

struct Fonts {
    static let mainFontForDetailScreen = UIFont(name: "Copperplate", size: 30)
    static let fontForDetailScreen = UIFont(name: "Copperplate", size: 17)
    static let lightFontForDaily = UIFont(name: "Copperplate-Light", size: 17)
    static let boldFontForDaily = UIFont(name: "Copperplate-Bold", size: 17)
    static let special = UIFont(name: "Copperplate-Light", size: 13)
    static let specialBigger = UIFont(name: "Copperplate", size: 24)
}

struct Keys {
    static let googleKey = "AIzaSyCs7j4Ngv12hif30OndDfzpmqCKXkYDsAY"
    static let apiKey = "b0809fedc7ea832cdc5cc0f793119331"
}
