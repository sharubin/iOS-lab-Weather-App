//
//  DetailVCViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {
    
    var weather: WeatherData!
    private var dailyModels = [Daily]()
    private var hourlyModels = [Hourly]()
    
    override func loadView() {
        super.loadView()
        
        self.view = DetailScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dcv = self.view as? DetailScreenView
        dcv?.downloadMoreBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        dcv?.hourlyCollectionView.dataSource = self
        dcv?.hourlyCollectionView.delegate = self
        dcv?.dailyTableView.dataSource = self
        dcv?.dailyTableView.delegate = self
        
        updateCurrent(weather: weather)
        
        NetworkEngine.request(endpoint: OneCallEndpoint.getCurrenWeather(lat: "\(weather.coord.lat)", lon: "\(weather.coord.lon)", exclude: "current,minutely,alerts")) { (result: Result<MoreWeatherData, Error>) in
            switch result {
            case .success(let response):
                self.hourlyModels = response.hourly
                self.dailyModels = response.daily
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc private func buttonTapped() {
        let dcv = self.view as? DetailScreenView
        dcv?.dailyTableView.reloadData()
        dcv?.hourlyCollectionView.reloadData()
        showMore()
    }
    
    private func showMore() {
        let dcv = self.view as? DetailScreenView
        dcv?.dailyTableView.isHidden = false
        dcv?.hourlyCollectionView.isHidden = false
    }
    
    private func updateCurrent(weather: WeatherData) {
        let dcv = self.view as? DetailScreenView
        guard let dcv = dcv else { return  }
        dcv.cityLbl.text = weather.name
        dcv.temperatureLbl.text = "\(Int(weather.main.temp)) °С"
        dcv.iconImage.kf.setImage(with: URL(string: "https://openweathermap.org/img/wn/\(weather.weather.first!.icon)@2x.png"), placeholder: nil, options: nil)
        dcv.descriptionLbl.text = weather.weather.first?.weatherDescription
        dcv.minTempLbl.text = "\(Int(weather.main.tempMin)) °С"
        dcv.maxTempLbl.text = "\(Int(weather.main.tempMax)) °С"
        dcv.feelsLikeLbl.text = "\(Int(weather.main.feelsLike)) °С"
        dcv.pressureLbl.text = "\(weather.main.pressure) мм.рт.ст"
        dcv.humidityLbl.text = "\(weather.main.humidity) %"
        dcv.visibilityLbl.text = "\(weather.visibility) км"
        dcv.windSpeedLbl.text = "\(weather.wind.speed) м.c"
        dcv.windDegreeLbl.text = "\(weather.wind.deg) градусов"
    }
}


extension DetailVC: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hourlyModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as! HourlyCollectionViewCell
        cell.updateHourly(weather: hourlyModels[indexPath.row])
        
        return cell
    }
}

extension DetailVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dailyModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.identifier, for: indexPath) as! DailyTableViewCell
        cell.updateDaily(weather: dailyModels[indexPath.row])
        
        return cell
    }
}
