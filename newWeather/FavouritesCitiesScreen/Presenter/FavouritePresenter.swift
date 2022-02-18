//
//  FavouritePresenter.swift
//  newWeather
//
//  Created by Artsem Sharubin on 14.02.2022.
//

import Foundation

protocol FavouritePresenterProtocol {
    func fetchData()
    func deleteByIndex(index: Int)
    func pushTo(index: Int)
}

class FavouritePresenter {

    weak var view: FavouriteViewProtocol?
    private let repository: FavouriteRepositoryProtocol
    var dataSource = [FavouriteWeatherCellModel]()
    
    init(view: FavouriteViewProtocol, repository: FavouriteRepositoryProtocol = FavouriteCityRepository()) {
        self.view = view
        self.repository = repository
    }
}

extension FavouritePresenter: FavouritePresenterProtocol {
    
    func deleteByIndex(index: Int) {
        repository.deleteFromDB(city: (dataSource[index].city))
        dataSource.remove(at: index)
        view?.setData(data: dataSource)
    }
    
    func pushTo(index: Int) {
        let name: String
        name = dataSource[index].city
        repository.getWeatherForCity(name: name) { [weak self] result in
            switch result {
            case .success(let response):
                let nextVC = DetailViewController(weather: response)
                self?.view?.pushTo(controller: nextVC)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchData() {
        repository.getData { [weak self] result in
            switch result {
            case .success(let response):
                self?.dataSource = response
                self?.view?.setData(data: response)
            case .failure:
                print(Strings.FavouriteView.error)
            }
        }
    }
}
