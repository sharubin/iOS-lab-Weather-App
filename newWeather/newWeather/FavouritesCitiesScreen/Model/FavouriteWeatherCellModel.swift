//
//  FavouriteWeatherData.swift
//  newWeather
//
//  Created by Artsem Sharubin on 14.02.2022.
//

import UIKit

struct FavouriteWeatherCellModel {
    let id: Int
    let city: String
    let description: String
    let temp: Double
    let minTemp: Double
    let maxTemp: Double

    init(model: CityModel) {
        self.id = model.id
        self.city = model.city
        self.description = model.descriptionWeather
        self.temp = model.temp
        self.minTemp = model.tempMin
        self.maxTemp = model.tempMax
    }

    init(model: WeatherData) {
        self.id = model.weather[0].id
        self.city = model.name
        self.description = model.weather[0].weatherDescription
        self.temp = model.main.temp
        self.minTemp = model.main.tempMin
        self.maxTemp = model.main.tempMax
    }

    public func getBackgroundColor() -> UIColor {
        switch id {
        case 200...499, 502...531, 701...781, 802...804, 600...622:
            return Colors.badWeatherColor
        case 800...801, 500...501:
            return Colors.goodWeatherColor
        default:
            return .white
        }
    }
}
