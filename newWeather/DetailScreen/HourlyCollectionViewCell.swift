//
//  WeatherCollectionViewCell.swift
//  newWeather
//
//  Created by Artsem Sharubin on 02.02.2022.
//

import UIKit
import Kingfisher

class HourlyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HourlyCollectionViewCell"
    
    var iconImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var tempLabel = UILabel().then {
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var timeLabel = UILabel().then {
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateHourly(weather: Hourly) {
        timeLabel.text = weather.getTimeForDate()
        iconImageView.kf.setImage(with: weather.getLink(), placeholder: nil, options: nil)
        tempLabel.text = "\(Int(weather.temp))°"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(tempLabel)
        contentView.addSubview(timeLabel)
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        iconImageView.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(50)
            $0.top.equalTo(timeLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(5)
        }
    }
}
