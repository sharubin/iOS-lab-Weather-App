//
//  CityModel.swift
//  newWeather
//
//  Created by Artsem Sharubin on 12.02.2022.
//

import RealmSwift

@objcMembers
class CityModel: Object {
    dynamic var id = Int()
    dynamic var city = String()
    dynamic var descriptionWeather = String()
    dynamic var temp = Double()
    dynamic var tempMin = Double()
    dynamic var tempMax = Double()
    dynamic var lat = Double()
    dynamic var lon = Double()

    override static func primaryKey() -> String? {
      return "city"
    }

    convenience init(city: String, descriptionWeather: String, temp: Double, tempMin: Double, tempMax: Double, id: Int, lat: Double, lon: Double ) {
        self.init()
        self.id = id
        self.city = city
        self.descriptionWeather = descriptionWeather
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.lat = lat
        self.lon = lon

    }

    override init() {
        super.init()
    }

    init(weather: WeatherData) {
        self.id = weather.weather[0].id
        self.city = weather.name
        self.descriptionWeather = weather.weather[0].weatherDescription
        self.temp = weather.main.temp
        self.tempMin = weather.main.tempMin
        self.tempMax = weather.main.tempMax
        self.lat = weather.coord.lat
        self.lon = weather.coord.lon
    }
}
