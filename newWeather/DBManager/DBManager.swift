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
    
    func obtainData() -> [CityModel] {
        let models = mainRealm.objects(CityModel.self)
        return Array(models)
    }
    
}
