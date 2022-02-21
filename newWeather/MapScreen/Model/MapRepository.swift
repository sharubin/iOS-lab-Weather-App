//
//  MapRepository.swift
//  newWeather
//
//  Created by Artsem Sharubin on 21.02.2022.
//

import Foundation

protocol MapRepositoryProtocol {
    func getWeatherForCoordinates(lat: String, lon: String, completion: @escaping (Result< WeatherData,Error>) -> Void)
    func obtainCities() -> [CityModel]
}

class MapRepository: MapRepositoryProtocol {
    
    private let networkEngine: NetworkEngine
    private let dbManager: DBManager
    
    init(networkEngine: NetworkEngine = NetworkEngine(), dbManager: DBManager = DBManagerImpl()) {
        self.networkEngine = networkEngine
        self.dbManager = dbManager
    }
        
    func getWeatherForCoordinates(lat: String, lon: String, completion: @escaping (Result< WeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: CurrentCoordinateEndpoint.getCurrenWeather(lat: lat, lon: lon), completion: completion)
    }
    
    func obtainCities() -> [CityModel] {
        dbManager.obtainCities()
    }
    
}
