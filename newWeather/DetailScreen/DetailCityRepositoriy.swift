//
//  DetailCityRepositoriy.swift
//  newWeather
//
//  Created by Artsem Sharubin on 07.02.2022.
//

class DetailCityRepositoriy {
    
    private let networkEngine: NetworkEngine
    private let dbManager: DBManager
    
    init(networkEngine: NetworkEngine = NetworkEngine(),dbManager: DBManager = DBManagerImpl()) {
        self.networkEngine = networkEngine
        self.dbManager = dbManager
    }
    
    func addToDB(dataModel: CityModel) {
        dbManager.save(data: dataModel)
    }
    
    func obtainFor(city: String) -> String {
        dbManager.obtain(city: city)
    }
    
    func deleteFromDB(city: String) {
        dbManager.removeObjectFor(city: city)
    }
    
    func getWeatherForCity(lat: String, lon: String, completion: @escaping (Result< MoreWeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: OneCallEndpoint.getCurrenWeather(lat: lat, lon: lon, exclude: "current,minutely,alerts"), completion: completion)
    }
}
