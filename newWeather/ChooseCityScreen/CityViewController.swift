//
//  ViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit

class CityViewController: UIViewController {

    
    override func loadView() {
       super.loadView()
        
        self.view = CityScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fsv = self.view as? CityScreenView
        fsv?.downloadBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    let weather = WeatherData(coord: Coord(lon: 53.233, lat: 33.3423),weather: [Weather(weatherDescription: "sun", icon: "10d")]  , main: Main(temp: 32, feelsLike: 19, tempMin: 20, tempMax: 33, pressure: 10, humidity: 1), visibility: 2, wind: Wind(speed: 10, deg: 300), timezone: 2, name: "минск")
    
    @objc func buttonTapped() {
        let vc = DetailVC()
        vc.weather = weather
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    

}

