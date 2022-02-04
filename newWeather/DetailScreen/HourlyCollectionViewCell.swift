//
//  WeatherCollectionViewCell.swift
//  newWeather
//
//  Created by Artsem Sharubin on 02.02.2022.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HourlyCollectionViewCell"
    
    var iconImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "arrow.down")
        
    }
    var tempLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "temp"
    }
    var timeLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "time"
    }
    // MARK: - NewMethods
    func updateHourly(weather: MoreWeatherData) {
        timeLabel.text = getTimeForDate(Date(timeIntervalSince1970: Double(weather.hourly!.first!.dt)))
        iconImageView.image = weather.hourlyConditionIcon
        tempLabel.text = "\(Int(weather.hourly!.first!.temp))"
    }
    
    func getTimeForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: inputDate)
    }
    // MARK: - NewMethodsOver
    
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
            $0.top.equalTo(timeLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(10)
        }
        tempLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalTo(5)
        }
        
    }
}
