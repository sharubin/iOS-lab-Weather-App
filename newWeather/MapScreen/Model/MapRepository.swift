//
//  MapRepository.swift
//  newWeather
//
//  Created by Artsem Sharubin on 21.02.2022.
//

import Foundation

protocol MapRepositoryProtocol {
    func getWeatherForCoordinates(lat: String, lon: String, completion: @escaping (Result< WeatherData,Error>) -> Void)
}

class MapRepository: MapRepositoryProtocol {
    
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
        
    func getWeatherForCoordinates(lat: String, lon: String, completion: @escaping (Result< WeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: CurrentCoordinateEndpoint.getCurrenWeather(lat: lat, lon: lon), completion: completion)
    }
}
