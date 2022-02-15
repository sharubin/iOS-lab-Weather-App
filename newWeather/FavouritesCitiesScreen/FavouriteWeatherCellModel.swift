//
//  FavouriteWeatherData.swift
//  newWeather
//
//  Created by Artsem Sharubin on 14.02.2022.
//

import Foundation

struct FavouriteWeatherCellModel {
    
    let city: String
    let description: String
    let temp: Double
    let minTemp: Double
    let maxTemp: Double
    
    init(model: CityModel) {
        self.city = model.city
        self.description = model.descriptionWeather
        self.temp = model.temp
        self.minTemp = model.tempMin
        self.maxTemp = model.tempMax
    }
    
    init(model: WeatherData) {
        self.city = model.name
        self.description = model.weather[0].weatherDescription
        self.temp = model.main.temp
        self.minTemp = model.main.tempMin
        self.maxTemp = model.main.tempMax
    }
    
}
