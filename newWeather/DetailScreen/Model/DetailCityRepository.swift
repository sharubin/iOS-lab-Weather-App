//
//  DetailCityRepositoriy.swift
//  newWeather
//
//  Created by Artsem Sharubin on 07.02.2022.
//

protocol DetailRepositoryProtocol {
    func saveFavourite(dataModel: WeatherData)
    func obtainFor(city: String) -> String
    func deleteFromDB(city: String)
    func check(name: String) -> Bool
    func getWeatherForCity(lat: String, lon: String, completion: @escaping (Result< MoreWeatherData,Error>) -> Void)
}


class DetailCityRepository: DetailRepositoryProtocol {
    
    private let networkEngine: NetworkEngine
    private let dbManager: DBManager
    
    init(networkEngine: NetworkEngine = NetworkEngine(),dbManager: DBManager = DBManagerImpl()) {
        self.networkEngine = networkEngine
        self.dbManager = dbManager
    }
    
    func saveFavourite(dataModel: WeatherData) {
        let dataModel = CityModel(weather: dataModel)
        dbManager.save(data: dataModel)
    }
    
    func obtainFor(city: String) -> String {
        dbManager.obtain(city: city)
    }
        
    func deleteFromDB(city: String) {
        dbManager.removeCity(city: city)
    }
    
    func check(name: String) -> Bool {
        let cityFromDB = obtainFor(city: name)
        if name == cityFromDB {
            return true
        } else {
            return false
        }
    }
    
    func getWeatherForCity(lat: String, lon: String, completion: @escaping (Result< MoreWeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: OneCallEndpoint.getCurrenWeather(lat: lat, lon: lon, exclude: "current,minutely,alerts"), completion: completion)
    }
}
