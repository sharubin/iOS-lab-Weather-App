//
//  FavouriteViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit

class FavouriteViewController: UIViewController {

//    var presenter: FavouritePresenter!
    
    private let repository = FavouriteCityRepositoriy()
    let customView = FavouriteScreenView()
    
 
    var dataSource = [FavouriteWeatherCellModel]()
    
    override func loadView() {
        super.loadView()
        
        self.view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
       
  //      presenter = FavouritePresenter(view: self)
    }
    
    private func setup() {
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        fetchData()
    }
    
    private func fetchData() {
        repository.getData { result in
            switch result {
            case .success(let response):
                self.dataSource = response
                self.customView.tableView.reloadData()
            case .failure:
                print("print error")
            }
        }
    }
}


extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as! FavouriteTableViewCell
        cell.updateFavouriteFromDB(weather: dataSource[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = DetailViewController()
        
        let name: String
        name = dataSource[indexPath.row].city
        repository.getWeatherForCity(name: name) { result in
            switch result {
            case .success(let response):
                nextVC.weather = response
                self.navigationController?.pushViewController(nextVC, animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
