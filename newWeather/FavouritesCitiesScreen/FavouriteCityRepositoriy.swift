//
//  FavouriteCityRepositoriy.swift
//  newWeather
//
//  Created by Artsem Sharubin on 12.02.2022.
//

import Foundation
class FavouriteCityRepositoriy {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getWeatherForCity(name: String, completion: @escaping (Result< WeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: CurrentEndpoint.getCurrenWeather(city: name), completion: completion)
    }
    
}
