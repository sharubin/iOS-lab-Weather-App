//
//  DBManager.swift
//  newWeather
//
//  Created by Artsem Sharubin on 12.02.2022.
//

import Foundation
import RealmSwift

protocol DBManager {
    func save(data: CityModel)
    func obtainCities() -> [CityModel]
    func obtain(city: Int) -> Int
    func removeCity(city: Int)
}

class DBManagerImpl: DBManager {
    var mainRealm = try! Realm()

    func save(data: CityModel) {
        try! mainRealm.write {
            mainRealm.add(data, update: .modified)
        }
    }

    func removeCity(city: Int) {
        let model = Array(mainRealm.objects(CityModel.self).filter("cityId == %@", city))
        guard let model = model.first else { return }
        dump(model)
        try! mainRealm.write {
            mainRealm.delete(model)
        }
    }

    func obtain(city: Int) -> Int {
        let model = Array(mainRealm.objects(CityModel.self).filter("cityId == %@", city))
        let firstModel = model.first
        guard let firstModel = firstModel else { return 0 }
        let cityFromDB = firstModel.cityId
        return cityFromDB
    }

    func obtainCities() -> [CityModel] {
        let models = mainRealm.objects(CityModel.self)
        return Array(models)
    }
}
