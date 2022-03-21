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

    private let iconImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private let tempLabel = UILabel().then {
        $0.textColor = Colors.whiteColor
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }

    private let timeLabel = UILabel().then {
        $0.textColor = Colors.whiteColor
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }

    func updateHourly(weather: Hourly) {
        timeLabel.text = weather.getTimeForDate()
        iconImageView.kf.setImage(with: weather.getLink(), placeholder: nil, options: nil)
        tempLabel.text = String(format: Strings.DetailView.celsium, weather.temp)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
        setNeedsUpdateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(tempLabel)
    }

    override func updateConstraints() {
        super.updateConstraints()

        timeLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }

        iconImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(10)
            $0.height.width.equalTo(50)
        }

        tempLabel.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
