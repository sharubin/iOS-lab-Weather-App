//
//  DailyTableViewCell.swift
//  newWeather
//
//  Created by Artsem Sharubin on 03.02.2022.
//

import UIKit
import Kingfisher

class DailyTableViewCell: UITableViewCell {
    
    static let identifier = "DailyTableViewCell"
    
    var dayLabel = UILabel().then {
        $0.text = "day"
    }
    var lowTempLabel = UILabel().then {
        $0.text = "min"
    }
    var highTempLabel = UILabel().then {
        $0.text = "max"
    }
    
    var iconImageView = UIImageView().then {
        $0.image = UIImage(systemName: "sun.max")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(lowTempLabel)
        contentView.addSubview(highTempLabel)
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDaily(weather: Daily) {
        dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(weather.dt)))
        iconImageView.kf.setImage(with: URL(string: "https://openweathermap.org/img/wn/\(weather.weather.first!.icon)@2x.png"), placeholder: nil, options: nil)
        lowTempLabel.text = "\(Int(weather.temp.min))"
        highTempLabel.text = "\(Int(weather.temp.max))"
    }
    
    private func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.edges.equalToSuperview()
        }
        
        dayLabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(110)
            $0.leading.equalToSuperview().offset(10)
        }
        
        iconImageView.snp.makeConstraints {
            $0.height.equalTo(70)
            $0.width.equalTo(50)
            $0.top.equalToSuperview().offset(15)
            $0.left.equalTo(dayLabel.snp.right).offset(15)
        }
        lowTempLabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(30)
            $0.left.equalTo(iconImageView.snp.right).offset(80)
        }
        
        highTempLabel.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(60)
            $0.trailing.equalToSuperview().offset(10)
        }
    }
}
