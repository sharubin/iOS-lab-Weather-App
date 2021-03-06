//
//  MapPresenter.swift
//  newWeather
//
//  Created by Artsem Sharubin on 21.02.2022.
//

import Foundation
import GoogleMaps
import CoreLocation

protocol MapPresenterProtocol {
    func getWeather(lat: String, lon: String)
    func obtainCities()
    func getCoordinates()
    var managerLocation: CLLocationManager {get}
}

class MapPresenter {

    weak private var view: MapViewProtocol?
    private let repository: MapRepositoryProtocol
    var managerLocation = CLLocationManager()

    init(view: MapViewProtocol, repository: MapRepositoryProtocol = MapRepository()) {
        self.view = view
        self.repository = repository
        obtainCities()
    }
}

extension MapPresenter: MapPresenterProtocol {

    func getWeather(lat: String, lon: String) {
        repository.getWeatherForCoordinates(lat: lat, lon: lon) { [weak self] result in
            switch result {
            case .success(let response):
                let nextController = DetailViewController(weather: response)
                self?.view?.pushTo(controller: nextController)
                self?.view?.enableMap(bool: true)
            case .failure(let error):
                print(error)
                self?.view?.enableMap(bool: true)
            }
        }
    }

    func getCoordinates() {
        guard let coord = managerLocation.location?.coordinate else { return }
        self.view?.setCoordinate(coordinate: coord)
    }

    func obtainCities() {
        let arrayOfCityModel = repository.obtainCities()
        var arrayOfMarkers = [Marker]()
        for model in arrayOfCityModel {
        let marker = Marker(data: model)
            arrayOfMarkers.append(marker)
        }
        self.view?.setData(data: arrayOfMarkers)
    }
}
