//
//  MapPresenter.swift
//  newWeather
//
//  Created by Artsem Sharubin on 21.02.2022.
//

import Foundation
import GoogleMaps

protocol MapPresenterProtocol {
    func getWeather(lat: String, lon: String)
    func obtainCities()
}

class MapPresenter {

    weak private var view: MapViewProtocol?
    private let repository: MapRepositoryProtocol
    
    init(view: MapViewProtocol, repository: MapRepositoryProtocol = MapRepository()) {
        self.view = view
        self.repository = repository
        obtainCities()
    }
}

extension MapPresenter: MapPresenterProtocol {
    
    func getWeather(lat: String, lon: String) {
        repository.getWeatherForCoordinates(lat: lat, lon: lon)  { [weak self] result in
            switch result {
            case .success(let response):
                let vc = DetailViewController(weather: response)
                self?.view?.pushTo(controller: vc)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func obtainCities() {
        let arrayOfCityModel = repository.obtainCities()
        var arrayOfMarkers = [Marker]()
        for i in arrayOfCityModel{
        let marker = Marker(data: i)
            arrayOfMarkers.append(marker)
        }
        self.view?.setData(data: arrayOfMarkers)
    }
}
