//
//  FavouriteViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit

protocol FavouriteViewProtocol: AnyObject {
    func setData(data: [FavouriteWeatherCellModel])
    
    func pushTo(controller: UIViewController)
}

class FavouriteViewController: UIViewController, FavouriteViewProtocol {
    
    func setData(data: [FavouriteWeatherCellModel]) {
        dataSource = data
        rootView.tableView.reloadData()
    }
    
    var rootView: FavouriteScreenView {
        self.view as! FavouriteScreenView
    }
    var presenter: FavouritePresenterProtocol!
    var dataSource = [FavouriteWeatherCellModel]()
    
    override func loadView() {
        super.loadView()
        
        self.view = FavouriteScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
       
        presenter = FavouritePresenter(view: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.fetchData()
    }
    
    private func setup() {
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
    }
    
    func pushTo(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
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
        presenter.pushTo(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionDelete = UIContextualAction(style: .destructive, title: Strings.FavouriteView.delete) { [weak self] _,_,_ in
                self?.presenter.deleteByIndex(index: indexPath.row)
        }
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
    }
}
