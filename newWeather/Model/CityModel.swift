//
//  CityModel.swift
//  newWeather
//
//  Created by Artsem Sharubin on 12.02.2022.
//

import Foundation
import RealmSwift

@objcMembers
class CityModel: Object {
    
    dynamic var city = String()
    dynamic var descriptionWeather = String()
    dynamic var temp = Double()
    dynamic var tempMin = Double()
    dynamic var tempMax = Double()
  
    
    convenience init(city: String, descriptionWeather: String, temp: Double, tempMin: Double, tempMax: Double ) {
        self.init()
        self.city = city
        self.descriptionWeather = descriptionWeather
        self.temp = temp
        self.tempMin = tempMin
        self.tempMax = tempMax
    }
    
    override init() {
        super.init()
    }
    
}
