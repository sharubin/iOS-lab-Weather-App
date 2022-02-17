//
//  DetailVCViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var rootView: DetailScreenView {
        self.view as! DetailScreenView
    }
    private let repository = DetailCityRepository()
    var weather: WeatherData!
    private var dailyModels = [Daily]()
    private var hourlyModels = [Hourly]()
    
    override func loadView() {
        super.loadView()
        
        self.view = DetailScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    @objc private func buttonTapped() {
        rootView.changeSpinnerStatus()
        repository.getWeatherForCity(lat: "\(weather.coord.lat)", lon: "\(weather.coord.lon)") { [self] result in
            switch result {
            case .success(let response):
                self.hourlyModels = response.hourly
                self.dailyModels = response.daily
                self.rootView.changeSpinnerStatus()
                rootView.showMore()
            case .failure(let error):
                print(error)
            }
        }
        rootView.downloadMoreButton.isHidden = true
    }
    
    private func setup() {
        rootView.downloadMoreButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        rootView.hourlyCollectionView.dataSource = self
        rootView.hourlyCollectionView.delegate = self
        rootView.dailyTableView.dataSource = self
        rootView.dailyTableView.delegate = self
        rootView.updateCurrent(weather: weather)
        setupNavigationBar()
        check()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = weather.getBackgroundColor()
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem?.tintColor = Colors.whiteColor
    }
    
    private func check() {
        
        if repository.check(name: weather.name) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "remove Fv",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(updateFavourite))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add Fv",
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(updateFavourite))
        }
    }
    
    @objc private func updateFavourite() {
        if repository.check(name: weather.name) {
            repository.deleteFromDB(city: weather.name)
            navigationItem.rightBarButtonItem?.title = "add Fv"
        } else {
            let model = CityModel(weather: weather)
            repository.saveFavourite(dataModel: model)
            navigationItem.rightBarButtonItem?.title = "remove Fv"
        }
    }
}


extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as! HourlyCollectionViewCell
        cell.updateHourly(weather: hourlyModels[indexPath.row])
        
        return cell
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dailyModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.identifier, for: indexPath) as! DailyTableViewCell
        cell.updateDaily(weather: dailyModels[indexPath.row])
        cell.backgroundColor = .clear
        
        return cell
    }
}
