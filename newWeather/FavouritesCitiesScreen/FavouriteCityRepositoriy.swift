//
//  FavouriteCityRepositoriy.swift
//  newWeather
//
//  Created by Artsem Sharubin on 12.02.2022.
//

import Foundation
class FavouriteCityRepositoriy {
    private let networkEngine: NetworkEngine
    private let dbManager: DBManager
    
    init(networkEngine: NetworkEngine = NetworkEngine(),dbManager: DBManager = DBManagerImpl()) {
        self.networkEngine = networkEngine
        self.dbManager = dbManager
    }
    
    func getWeatherForCity(name: String, completion: @escaping (Result< WeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: CurrentEndpoint.getCurrenWeather(city: name), completion: completion)
    }
    
    func getData(completion: @escaping (Result< [FavouriteWeatherCellModel],Error>) -> Void) {
        let dbArray = dbManager.obtainData()
        let cellModels = dbArray.map { FavouriteWeatherCellModel(model: $0) }
        completion(.success(cellModels))
        fetchUpdatedWeather(for: cellModels.map { $0.city }, completion: completion)
    }
    
    func fetchUpdatedWeather(for cities:[String], completion: @escaping (Result< [FavouriteWeatherCellModel],Error>) -> Void ) {
        var cellModels = [FavouriteWeatherCellModel]()
        let group = DispatchGroup()
        for city in cities {
            group.enter()
            getWeatherForCity(name: city) { result in
                switch result {
                case .success(let data):
                    print("data loaded \(city.uppercased())")
                    //добавить код для обновления базы данных
                    cellModels.append(FavouriteWeatherCellModel(model: data))
                case .failure:
                    break
                }
                group.leave()
                
            }
        }
        group.notify(queue: .main) {
            completion(.success(cellModels))
        }
    }

}
