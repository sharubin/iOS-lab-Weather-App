//
//  DetailVCViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let repository = DetailCityRepositoriy()
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
        let view = self.view as? DetailScreenView
        view?.changeSpinnerStatus()
        repository.getWeatherForCity(lat: "\(weather.coord.lat)", lon: "\(weather.coord.lon)") { result in
            switch result {
            case .success(let response):
                self.hourlyModels = response.hourly
                self.dailyModels = response.daily
                view?.changeSpinnerStatus()
                view?.showMore()
            case .failure(let error):
                print(error)
            }
        }
        view?.downloadMoreButton.isHidden = true
    }
    
    @objc private func addToFavourite() {
        let model = CityModel(weather: weather)
        repository.addToDB(dataModel: model)
    }
    
    private func setup() {
        let view = self.view as? DetailScreenView
        view?.downloadMoreButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view?.hourlyCollectionView.dataSource = self
        view?.hourlyCollectionView.delegate = self
        view?.dailyTableView.dataSource = self
        view?.dailyTableView.delegate = self
        view?.updateCurrent(weather: weather)
        navigationController?.navigationBar.barTintColor = weather.getBackgroundColor()
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add Fv",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addToFavourite))
        navigationItem.rightBarButtonItem?.tintColor = Colors.whiteColor
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
