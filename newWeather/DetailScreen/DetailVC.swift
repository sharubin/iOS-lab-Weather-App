//
//  DetailVCViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit

class DetailVC: UIViewController {
    
    var dailyModels = [MoreWeatherData]()
    var hourlyModels = [MoreWeatherData]()
    
    // MARK: - Test
  
    let weatherDaily1 = MoreWeatherData(timezone: nil, hourly: nil, daily: [Daily(dt: 1643889900, temp: Temp(min: 10, max: 25), weather: [WeatherMore(icon: "10d")])])
    let weatherDaily2 = MoreWeatherData(timezone: nil, hourly: nil, daily: [Daily(dt: 1643899900, temp: Temp(min: 13, max: 15), weather: [WeatherMore(icon: "01d")])])
    let weatherDaily3 = MoreWeatherData(timezone: nil, hourly: nil, daily: [Daily(dt: 1643989900, temp: Temp(min: 10, max: 11), weather: [WeatherMore(icon: "02d")])])
    let weatherHourly1 = MoreWeatherData(timezone: nil, hourly: [Hourly(dt: 1643889900, temp: 12, weather: [WeatherMore(icon: "03d")])], daily: nil)
    let weatherHourly2 = MoreWeatherData(timezone: nil, hourly: [Hourly(dt: 1643889900, temp: 13, weather: [WeatherMore(icon: "01d")])], daily: nil)
    let weatherHourly3 = MoreWeatherData(timezone: nil, hourly: [Hourly(dt: 1643889900, temp: 14, weather: [WeatherMore(icon: "02d")])], daily: nil)
    
    func appendModels() {
        
        dailyModels.append(weatherDaily1)
        dailyModels.append(weatherDaily2)
        dailyModels.append(weatherDaily3)
        
        hourlyModels.append(weatherHourly1)
        hourlyModels.append(weatherHourly2)
        hourlyModels.append(weatherHourly3)
    }
// MARK: - TestOver
    
    override func loadView() {
       super.loadView()
        
        self.view = DetailScreenView()
        appendModels()                          //добавил тест
        updateCurrent(weather: weather)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dcv = self.view as? DetailScreenView
        dcv?.downloadMoreBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        dcv?.hourlyCollectionView.dataSource = self
        dcv?.hourlyCollectionView.delegate = self
        dcv?.dailyTableView.dataSource = self
        dcv?.dailyTableView.delegate = self
      /*
        NetworkEngine.request(endpoint: CurrentEndpoint.getCurrenWeather(city: "minsk")) { (result: Result<WeatherData, Error>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        } */
        NetworkEngine.request(endpoint: OneCallEndpoint.getCurrenWeather(lat: "27.5667", lon: "53.9", exclude: "current,minutely,alerts")) { (result: Result<MoreWeatherData, Error>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func buttonTapped() {
        let dcv = self.view as? DetailScreenView
        dcv?.showMore()
    }
    
    var weather: WeatherData!
        
    func updateCurrent(weather: WeatherData) {
        let scv = self.view as? DetailScreenView
        guard let scv = scv else { return  }
        scv.cityLbl.text = weather.name
        scv.temperatureLbl.text = "\(weather.main.temp) °С"
        scv.iconImage.image = weather.conditionIcon
        scv.descriptionLbl.text = weather.weather.first?.weatherDescription
        scv.minTempLbl.text = "\(weather.main.tempMin) °С"
        scv.maxTempLbl.text = "\(weather.main.tempMax) °С"
        scv.feelsLikeLbl.text = "\(weather.main.feelsLike) °С"
        scv.pressureLbl.text = "\(weather.main.pressure) мм.рт.ст"
        scv.humidityLbl.text = "\(weather.main.humidity) %"
        scv.visibilityLbl.text = "\(weather.visibility) км"
        scv.windSpeedLbl.text = "\(weather.wind.speed) м.c"
        scv.windDegreeLbl.text = "\(weather.wind.deg) градусов"
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
