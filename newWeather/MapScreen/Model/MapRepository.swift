//
//  MapRepository.swift
//  newWeather
//
//  Created by Artsem Sharubin on 21.02.2022.
//

import Foundation
import SwiftUI

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
       var dbArray = dbManager.obtainCities()
        fetchUpdatedWeather(for: dbArray)
        dbArray = dbManager.obtainCities()
        return dbArray
    }
    
    func saveFavourite(dataModel: WeatherData) {
        let dataModel = CityModel(weather: dataModel)
        dbManager.save(data: dataModel)
    }
    
    func fetchUpdatedWeather(for cities: [CityModel]) {
        for city in cities {
            getWeatherForCoordinates(lat: String(city.lat), lon: String(city.lon)) { result in
                switch result {
                case .success(let data):
                    print("data loaded \(city.city)")
                    self.saveFavourite(dataModel: data)
                case .failure:
                    break
                }
            }
        }
    }
    
}
