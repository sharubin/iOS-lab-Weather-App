//
//  ChooseCityRepositoriy.swift
//  newWeather
//
//  Created by Artsem Sharubin on 07.02.2022.
//

class ChooseCityRepositoriy {
    private let networkEngine: NetworkEngine
    
    init(networkEngine: NetworkEngine = NetworkEngine()) {
        self.networkEngine = networkEngine
    }
    
    func getWeatherForCity(name: String, completion: @escaping (Result< WeatherData,Error>) -> Void) {
        networkEngine.request(endpoint: CurrentEndpoint.getCurrenWeather(city: name), completion: completion)
    }
    
}
