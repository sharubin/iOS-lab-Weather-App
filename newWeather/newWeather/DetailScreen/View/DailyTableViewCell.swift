//
//  DailyTableViewCell.swift
//  newWeather
//
//  Created by Artsem Sharubin on 03.02.2022.
//

import UIKit
import Kingfisher
import Then

class DailyTableViewCell: UITableViewCell {

    static let identifier = "DailyTableViewCell"

    private let dayLabel = UILabel().then {
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.fontForDetailScreen
    }

    private let lowTempLabel = UILabel().then {
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.lightFontForDaily
    }

    private let highTempLabel = UILabel().then {
        $0.textColor = Colors.whiteColor
        $0.font = Fonts.boldFontForDaily
    }

    private let iconImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
        setNeedsUpdateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(lowTempLabel)
        contentView.addSubview(highTempLabel)
    }

    func updateDaily(weather: Daily) {
        dayLabel.text = weather.getDayForDate()
        iconImageView.kf.setImage(with: weather.getLink(), placeholder: nil, options: nil)
        lowTempLabel.text = String(format: Strings.DetailView.celsium, weather.temp.min)
        highTempLabel.text =  String(format: Strings.DetailView.celsium, weather.temp.max)
    }

    override func updateConstraints() {
        super.updateConstraints()

        dayLabel.snp.makeConstraints {
            $0.width.equalTo(115)
            $0.top.equalToSuperview().inset(45)
            $0.leading.equalToSuperview().offset(10)
        }

        iconImageView.snp.makeConstraints {
            $0.height.equalTo(70)
            $0.width.equalTo(70)
            $0.top.equalToSuperview().offset(15)
            $0.left.equalTo(dayLabel.snp.right).offset(5)
        }

        lowTempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.left.equalTo(iconImageView.snp.right).offset(20)
        }

        highTempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(45)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
