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
    
    var cityLbl = UILabel().then {
        $0.text = "город"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 23)
    }
    let temperatureLbl = UILabel().then {
        $0.text = "0°"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 23)
    }
    let iconImage = UIImageView().then {
        $0.image = UIImage(systemName: "sun.max")
    }
    let descriptionLbl = UILabel().then {
        $0.text = "информация не загружена"
        $0.font = UIFont.systemFont(ofSize: 23)
    }
    let maxTempLbl = UILabel().then {
        $0.text = "0°"
       
    }
    let minTempLbl = UILabel().then {
        $0.text = "0°"
        
    }
    let feelsLikeLbl = UILabel().then {
        $0.text = "0"
        
    }
    let pressureLbl = UILabel().then {
        $0.text = "0"
        
    }
    let humidityLbl = UILabel().then {
        $0.text = "0"
        
    }
    let visibilityLbl = UILabel().then {
        $0.text = "0"
        
    }
    let windSpeedLbl = UILabel().then {
        $0.text = "0"
        
    }
    let windDegreeLbl = UILabel().then {
        $0.text = "0"
        
    }
    let lbl1 = UILabel().then {
        $0.text = "максимальная температура"
        
    }
    let lbl2 = UILabel().then {
        $0.text = "минимальная температура"
        
    }
    let lbl3 = UILabel().then {
        $0.text = "ощущается как"
       
    }
    let lbl4 = UILabel().then {
        $0.text = "давление"
        
    }
    let lbl5 = UILabel().then {
        $0.text = "влажность"
     
    }
    let lbl6 = UILabel().then {
        $0.text = "видимость"
        
    }
    let lbl7 = UILabel().then {
        $0.text = "скорость ветра"
       
    }
    let lbl8 = UILabel().then {
        $0.text = "направление ветра"
        
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
    
    let downloadMoreBtn = UIButton().then {
        $0.setTitle("load more", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        
    }
    
    let hourleCollectionViewFlowLayout = UICollectionViewFlowLayout().with {
           $0.scrollDirection = .horizontal
           $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
           $0.minimumInteritemSpacing = 16
        $0.itemSize = CGSize(width: 100, height: 100)
       }
    lazy var hourlyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: hourleCollectionViewFlowLayout).with {
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.allowsMultipleSelection = true
            $0.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        $0.isHidden = true

        }
    let dailyTableView = UITableView().then {
        $0.isScrollEnabled = false
        $0.register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.identifier)
        $0.isHidden = true
    }
    
    func showMore() {
        dailyTableView.isHidden = false
        hourlyCollectionView.isHidden = false
    }
   
    func viewAddSubview() {
        addSubview(scrollView)
   
        scrollView.addSubview(view)

        view.addSubview(fullStack)
        
        fullStack.addArrangedSubview(topStack)
        fullStack.addArrangedSubview(bottomStack)
        fullStack.addArrangedSubview(downloadMoreBtn)
        fullStack.addArrangedSubview(hourlyCollectionView)
        fullStack.addArrangedSubview(dailyTableView)
        
        topStack.addArrangedSubview(cityLbl)
        topStack.addArrangedSubview(iconImage)
        topStack.addArrangedSubview(descriptionLbl)
        topStack.addArrangedSubview(temperatureLbl)
        
        bottomStack.addArrangedSubview(leftBottomStack)
        bottomStack.addArrangedSubview(rightBottomStack)
        
        leftBottomStack.addArrangedSubview(lbl2)
        leftBottomStack.addArrangedSubview(lbl1)
        leftBottomStack.addArrangedSubview(lbl3)
        leftBottomStack.addArrangedSubview(lbl4)
        leftBottomStack.addArrangedSubview(lbl5)
        leftBottomStack.addArrangedSubview(lbl6)
        leftBottomStack.addArrangedSubview(lbl7)
        leftBottomStack.addArrangedSubview(lbl8)
        
        rightBottomStack.addArrangedSubview(minTempLbl)
        rightBottomStack.addArrangedSubview(maxTempLbl)
        rightBottomStack.addArrangedSubview(feelsLikeLbl)
        rightBottomStack.addArrangedSubview(pressureLbl)
        rightBottomStack.addArrangedSubview(humidityLbl)
        rightBottomStack.addArrangedSubview(visibilityLbl)
        rightBottomStack.addArrangedSubview(windSpeedLbl)
        rightBottomStack.addArrangedSubview(windDegreeLbl)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewAddSubview()
        backgroundColor = .systemGray4
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
        downloadMoreBtn.snp.makeConstraints {
            $0.height.equalTo(30)
        }

        hourlyCollectionView.snp.makeConstraints {
            $0.height.equalTo(90)
        }
        dailyTableView.snp.makeConstraints {
            $0.height.equalTo(700)
        }
       
    }
}


