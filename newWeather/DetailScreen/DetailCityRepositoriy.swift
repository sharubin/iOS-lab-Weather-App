//
//  DetailCityRepositoriy.swift
//  newWeather
//
//  Created by Artsem Sharubin on 07.02.2022.
//

import Foundation

class DetailCityRepositoriy {
    
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getWeatherForCity(lat: String, lon: String, completion: @escaping (Result< MoreWeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: OneCallEndpoint.getCurrenWeather(lat: lat, lon: lon, exclude: "current,minutely,alerts"), completion: completion)
    }
}
