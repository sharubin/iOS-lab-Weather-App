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
    
    func obtainData() -> [CityModel]
    
    func removeObject(object: Object)
    
    func obtainDataFor(city: String) -> Results<CityModel>
    
    func removeObjectFor(city: String)
}

class DBManagerImpl: DBManager {
    
    var mainRealm = try! Realm()
    
    func save(data: CityModel) {
        try! mainRealm.write {
            mainRealm.add(data, update: .modified)
        }
    }
    
    func removeObject(object: Object) {
        try! mainRealm.write {
            mainRealm.delete(object)
        }
    }
    
    func removeObjectFor(city: String) {
        let model = Array(mainRealm.objects(CityModel.self).filter("city == %@", city))
        guard let model = model.first else { return }
        dump(model)
        try! mainRealm.write {
            mainRealm.delete(model)
        }
    }
    
    func obtainDataFor(city: String) -> Results<CityModel> {
        let model = mainRealm.objects(CityModel.self).filter("city == %@", city)
        return model
    }
    
    func obtainData() -> [CityModel] {
        let models = mainRealm.objects(CityModel.self)
        return Array(models)
    }
    
}
