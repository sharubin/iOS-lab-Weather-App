//
//  FavouriteTableViewCell.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit
import Then
import SnapKit

class FavouriteTableViewCell: UITableViewCell {
    
    static let identifier = "FavouriteTableViewCell"
    
    let citylabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.mainFontForDetailScreen
    }
    
    let descriptionWeatherLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.fontForDetailScreen
    }
    
    let tempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.mainFontForDetailScreen
    }
    
    let minMaxTempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.fontForDetailScreen
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentViewAddSubview()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func contentViewAddSubview() {
        contentView.addSubview(citylabel)
        contentView.addSubview(descriptionWeatherLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(minMaxTempLabel)
    }
    
    func updateFavourite(weather: WeatherData) {
        citylabel.text = weather.name
        descriptionWeatherLabel.text = weather.weather[0].weatherDescription
        tempLabel.text = String(format: Strings.DetailView.celsium, weather.main.temp)
        minMaxTempLabel.text = String(format: Strings.DetailView.minMaxTemp, weather.main.tempMin, weather.main.tempMax)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(125.5)
            $0.edges.equalToSuperview()
        }
        
        citylabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(150)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(70)
        }
        
        descriptionWeatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(100)
        }
        
        minMaxTempLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.left.equalTo(descriptionWeatherLabel.snp.right).offset(110)
            $0.height.equalTo(30)
        }
    }
}
