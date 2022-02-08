//
//  SecondScreenView.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit
import Then
import SnapKit

class DetailScreenView: UIView {
    
    var cityLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "Copperplate", size: 30)
    }
    let temperatureLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "Copperplate", size: 30)
    }
    let iconImage = UIImageView()
    let descriptionLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 23)
    }
    let maxTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let minTempLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let feelsLikeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let pressureLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let humidityLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let visibilityLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let windSpeedLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let windDegreeLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont(name: "Copperplate", size: 17)
    }
    let textMinTemp = UILabel().then {
        $0.text = "min temp"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let textMaxTemp = UILabel().then {
        $0.text = "max temp"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let textFeels = UILabel().then {
        $0.text = "feels like"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let textPressure = UILabel().then {
        $0.text = "pressure"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let textHumidity = UILabel().then {
        $0.text = "humidity"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let textVisibility = UILabel().then {
        $0.text = "visibility"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let textSpeed = UILabel().then {
        $0.text = "wind speed"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let textDegree = UILabel().then {
        $0.text = "wind direction"
        $0.font = UIFont(name: "Copperplate", size: 17)
        $0.textColor = .white
    }
    let scrollView = UIScrollView()
    
    let view = UIView()
    
    let fullStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
    }
    let topStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 10
    }
    let bottomStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 10
    }
    let rightBottomStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
    }
    let leftBottomStack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 10
    }
    let downloadMoreButton = UIButton().then {
        $0.setTitle("load more", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    let spinner = UIActivityIndicatorView().then {
        $0.isHidden = true
        $0.color = .white
    }
    let hourlyCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumInteritemSpacing = 16
        $0.itemSize = CGSize(width: 100, height: 100)
    }
    lazy var hourlyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: hourlyCollectionViewFlowLayout).with {
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.allowsMultipleSelection = true
        $0.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        $0.isHidden = true
        $0.layer.cornerRadius = 20
    }
    let dailyTableView = UITableView().then {
        $0.isScrollEnabled = false
        $0.register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.identifier)
        $0.isHidden = true
        $0.layer.cornerRadius = 20
    }
    
    func viewAddSubview() {
        addSubview(scrollView)
        scrollView.addSubview(view)
        view.addSubview(fullStack)
        
        fullStack.addArrangedSubview(topStack)
        fullStack.addArrangedSubview(bottomStack)
        fullStack.addArrangedSubview(downloadMoreButton)
        fullStack.addArrangedSubview(spinner)
        fullStack.addArrangedSubview(hourlyCollectionView)
        fullStack.addArrangedSubview(dailyTableView)
        
        topStack.addArrangedSubview(cityLabel)
        topStack.addArrangedSubview(iconImage)
        topStack.addArrangedSubview(descriptionLabel)
        topStack.addArrangedSubview(temperatureLabel)
        
        bottomStack.addArrangedSubview(leftBottomStack)
        bottomStack.addArrangedSubview(rightBottomStack)
        
        leftBottomStack.addArrangedSubview(textMinTemp)
        leftBottomStack.addArrangedSubview(textMaxTemp)
        leftBottomStack.addArrangedSubview(textFeels)
        leftBottomStack.addArrangedSubview(textPressure)
        leftBottomStack.addArrangedSubview(textHumidity)
        leftBottomStack.addArrangedSubview(textVisibility)
        leftBottomStack.addArrangedSubview(textSpeed)
        leftBottomStack.addArrangedSubview(textDegree)
        
        rightBottomStack.addArrangedSubview(minTempLabel)
        rightBottomStack.addArrangedSubview(maxTempLabel)
        rightBottomStack.addArrangedSubview(feelsLikeLabel)
        rightBottomStack.addArrangedSubview(pressureLabel)
        rightBottomStack.addArrangedSubview(humidityLabel)
        rightBottomStack.addArrangedSubview(visibilityLabel)
        rightBottomStack.addArrangedSubview(windSpeedLabel)
        rightBottomStack.addArrangedSubview(windDegreeLabel)
    }
    
    func showMore() {
        dailyTableView.isHidden = false
        hourlyCollectionView.isHidden = false
        dailyTableView.reloadData()
        hourlyCollectionView.reloadData()
    }
    
    func updateCurrent(weather: WeatherData) {
        
        backgroundColor = weather.getBackgroundColor()
        hourlyCollectionView.backgroundColor = weather.getCellsBackgroundColor()
        dailyTableView.backgroundColor = weather.getCellsBackgroundColor()
        
        cityLabel.text = weather.name
        temperatureLabel.text = "\(Int(weather.main.temp)) °С"
        iconImage.kf.setImage(with: URL(string: "https://openweathermap.org/img/wn/\(weather.weather.first!.icon)@2x.png"), placeholder: nil, options: nil)
        descriptionLabel.text = weather.weather.first?.weatherDescription
        minTempLabel.text = "\(Int(weather.main.tempMin)) °С"
        maxTempLabel.text = "\(Int(weather.main.tempMax)) °С"
        feelsLikeLabel.text = "\(Int(weather.main.feelsLike)) °С"
        let mmRtSt = Int(Double(weather.main.pressure) * 0.75)
        pressureLabel.text = "\(mmRtSt) mm Hg"
        humidityLabel.text = "\(weather.main.humidity) %"
        visibilityLabel.text = "\(weather.visibility) м"
        windSpeedLabel.text = "\(weather.wind.speed) m/s"
        windDegreeLabel.text = weather.getDirectionForDegree()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewAddSubview()
       // backgroundColor = UIColor(red: 59/255.0, green: 143/255.0, blue: 195/255.0, alpha: 1.0)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        view.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        fullStack.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
        iconImage.snp.makeConstraints {
            $0.width.height.equalTo(120)
        }
        downloadMoreButton.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        spinner.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }
        hourlyCollectionView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        dailyTableView.snp.makeConstraints {
            $0.height.equalTo(700)
        }
    }
}


