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
    }

    private let timeLabel = UILabel().then {
        $0.textColor = Colors.whiteColor
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private let stack = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 5
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

    private func setup() {
        contentView.addSubview(stack)
        stack.addArrangedSubview(timeLabel)
        stack.addArrangedSubview(iconImageView)
        stack.addArrangedSubview(tempLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        super.updateConstraints()

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        stack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        iconImageView.snp.makeConstraints {
            $0.height.width.equalTo(50)
        }
    }
}
