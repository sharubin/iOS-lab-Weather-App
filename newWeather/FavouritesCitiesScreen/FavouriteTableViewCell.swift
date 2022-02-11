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
        $0.text = "TestCity"
        $0.textColor = .black
        $0.font = UIFont(name: "Copperplate", size: 30)
    }
    
    let descriptionWeatherLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.text = "Description"
        $0.font = UIFont(name: "Copperplate", size: 15)
    }
    
    let tempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "-17°"
        $0.textColor = .black
        $0.font = UIFont(name: "Copperplate", size: 30)
    }
    
    let minMaxTempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "min.:-19°, max.:-16°"
        $0.textColor = .black
        $0.font = UIFont(name: "Copperplate", size: 15)
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
    
    override func updateConstraints() {
        super.updateConstraints()
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(125)
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
