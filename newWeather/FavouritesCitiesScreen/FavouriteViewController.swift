//
//  FavouriteViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit
import RealmSwift
import Foundation

class FavouriteViewController: UIViewController {

    let customView = FavouriteScreenView()
    let dbManager: DBManager = DBManagerImpl()
    private let repository = FavouriteCityRepositoriy()
    var favouriteModels = [CityModel]()
    var favouriteCities = [String]()
    var favouriteWeatherData = [WeatherData]()
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        favouriteModels = dbManager.obtainUsers()
        toUsualArray()
        print(favouriteCities)
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
                    self.favouriteWeatherData.append(response)
                    self.customView.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func setup() {
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
    }
}


extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouriteWeatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as! FavouriteTableViewCell
        cell.updateFavourite(weather: favouriteWeatherData[indexPath.row])
        
        return cell
    }
}
