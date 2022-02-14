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

    var presenter: FavouritePresenter!
    let customView = FavouriteScreenView()
    var favouriteWeatherData = [WeatherData]()
    
    override func loadView() {
        
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        presenter = FavouritePresenter(view: self)
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
