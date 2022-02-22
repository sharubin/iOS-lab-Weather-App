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
       let dbArray = dbManager.obtainCities()
        fetchUpdatedWeather(for: dbArray)
        return dbArray
    }
    
    
    func fetchUpdatedWeather(for cities:[CityModel]/*, completion: @escaping (Result< [CityModel],Error>) -> Void */ ) {
   //     var array = [CityModel]()
        let group = DispatchGroup()
        for city in cities {
            group.enter()
            getWeatherForCoordinates(lat: String(city.lat), lon: String(city.lon)) { result in
                switch result {
                case .success(let data):
                    print("data loaded \(city.city)")
                    let model = CityModel(weather: data)
                    self.dbManager.save(data: model)
//                    array.append(model)
                case .failure:
                    break
                }
                group.leave()
            }
        }
//        group.notify(queue: .main) {
//            completion(.success(array))
//        }
    }
    
}
