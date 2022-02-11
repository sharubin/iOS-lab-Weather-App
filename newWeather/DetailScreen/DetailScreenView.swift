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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.textAlignment = .center
        $0.font = Fonts.mainFontForDetailScreen
    }
    
    let temperatureLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.textAlignment = .center
        $0.font = Fonts.mainFontForDetailScreen
    }
    
    let iconImage = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let descriptionLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.mainFontForDetailScreen
    }
    
    let maxTempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let minTempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let feelsLikeLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let pressureLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let humidityLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let visibilityLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let windSpeedLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let windDegreeLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }
    
    let textMinTemp = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.minTemp
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    let textMaxTemp = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.maxTemp
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    let textFeels = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.feelsLike
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    let textPressure = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.pressure
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    let textHumidity = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.humidity
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    let textVisibility = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.visibility
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    let textSpeed = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.windSpeed
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    let textDegree = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.DetailView.windDirection
        $0.font = Fonts.fontForDetailScreen
        $0.textColor = Colors.whiteColor
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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(Strings.DetailView.textButton, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    let spinner = UIActivityIndicatorView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isHidden = true
        $0.color = Colors.whiteColor
    }
    
    let hourlyCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
        $0.scrollDirection = .horizontal
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumInteritemSpacing = 16
        $0.itemSize = CGSize(width: 70, height: 100)
    }
    
    lazy var hourlyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: hourlyCollectionViewFlowLayout).with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = false
        $0.allowsMultipleSelection = true
        $0.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        $0.isHidden = true
        $0.layer.cornerRadius = 20
    }
    
    let dailyTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
    
    func changeSpinnerStatus() {
        if spinner.isHidden == false {
            spinner.isHidden = true
            spinner.stopAnimating()
        } else {
            spinner.isHidden = false
            spinner.startAnimating()
        }
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
        temperatureLabel.text = String(format: Strings.DetailView.celsium, weather.main.temp)
        iconImage.kf.setImage(with: weather.getLink(), placeholder: nil, options: nil)
        descriptionLabel.text = weather.weather[0].weatherDescription
        minTempLabel.text = String(format: Strings.DetailView.celsium, weather.main.tempMin)
        maxTempLabel.text = String(format: Strings.DetailView.celsium, weather.main.tempMax)
        feelsLikeLabel.text = String(format: Strings.DetailView.celsium, weather.main.feelsLike)
        let mmRtSt = Double(weather.main.pressure) * 0.75
        pressureLabel.text = String(format: Strings.DetailView.mmHg, mmRtSt)
        humidityLabel.text = String(format: Strings.DetailView.percent, weather.main.humidity)
        visibilityLabel.text = String(format: Strings.DetailView.meters, weather.visibility)
        windSpeedLabel.text = String(format: Strings.DetailView.speedMS, weather.wind.speed)
        windDegreeLabel.text = weather.getDirectionForDegree()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewAddSubview()
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
       
        hourlyCollectionView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        
        dailyTableView.snp.makeConstraints {
            $0.height.equalTo(700)
        }
    }
}


