//
//  FavouritePresenter.swift
//  newWeather
//
//  Created by Artsem Sharubin on 14.02.2022.
//

import Foundation

class FavouritePresenter {
    
    weak var view: FavouriteViewController!
    
    let dbManager: DBManager = DBManagerImpl()
    private let repository = FavouriteCityRepositoriy()
    var favouriteModels = [CityModel]()
    var favouriteCities = [String]()
    
    init(view: FavouriteViewController) {
        self.view = view
        
        favouriteModels = dbManager.obtainUsers()
        toUsualArray()
        getWeatherForFavourites()
    }
    
    private func toUsualArray() {
        for i in favouriteModels {
            favouriteCities.append(i.city)
        }
    }
      
    private func getWeatherForFavourites() {
        for i in favouriteCities {
            repository.getWeatherForCity(name: i) { result in
                switch result {
                case .success(let response):
                    self.view.favouriteWeatherData.append(response)
                    self.view.customView.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
 
    
}
