//
//  FavouriteViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit

protocol FavouriteViewProtocol: AnyObject {
    
    func setData(data: [FavouriteWeatherCellModel])
    
}

class FavouriteViewController: UIViewController {

//    var presenter: FavouritePresenter!
    
    private let repository = FavouriteCityRepositoriy()
    
    var rootView: FavouriteScreenView {
        self.view as! FavouriteScreenView
    }
    var dataSource = [FavouriteWeatherCellModel]()
    
    override func loadView() {
        super.loadView()
        
        self.view = FavouriteScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
       
  //      presenter = FavouritePresenter(view: self)
    }
    
    private func setup() {
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        fetchData()
    }
    
    private func fetchData() {
        repository.getData { [weak self] result in
            switch result {
            case .success(let response):
                self?.dataSource = response
                self?.rootView.tableView.reloadData()
            case .failure:
                print(Strings.FavouriteView.error)
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionDelete = UIContextualAction(style: .destructive, title: Strings.FavouriteView.delete) { [weak self] _,_,_ in
            self?.repository.deleteFromDB(city: (self?.dataSource[indexPath.row].city)!)
            self?.dataSource.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
    }
}
