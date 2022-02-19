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
    
    private let citylabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.mainFontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    private let descriptionWeatherLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.lightFontForDaily
        $0.textColor = Colors.whiteColor
    }
    
    private let tempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.mainFontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    private let minMaxTempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = Fonts.lightFontForDaily
        $0.textColor = Colors.whiteColor
    }
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(citylabel)
        contentView.addSubview(descriptionWeatherLabel)
        contentView.addSubview(tempLabel)
        contentView.addSubview(minMaxTempLabel)
    }
    
    func set(model: FavouriteWeatherCellModel) {
        backgroundColor = model.getBackgroundColor()
        citylabel.text = model.city
        descriptionWeatherLabel.text = model.description
        tempLabel.text = String(format: Strings.DetailView.celsium, model.temp)
        minMaxTempLabel.text = String(format: Strings.DetailView.minMaxTemp, model.minTemp, model.maxTemp)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(126)
            $0.edges.equalToSuperview()
        }
        
        citylabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(170)
        }
        
        tempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(90)
        }
        
        descriptionWeatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.width.equalTo(150)
        }
        
        minMaxTempLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.left.equalTo(descriptionWeatherLabel.snp.right).offset(60)
            $0.height.equalTo(30)
        }
    }
}
