//
//  Marker.swift
//  newWeather
//
//  Created by Artsem Sharubin on 22.02.2022.
//

import Foundation

struct Marker {
    let name: String
    let lon: Double
    let lat: Double
    let minTemp: Double
    let maxTemp: Double

    init(data: CityModel) {
        self.name = data.city
        self.lon = data.lon
        self.lat = data.lat
        self.minTemp = data.tempMin
        self.maxTemp = data.tempMax
    }
}
