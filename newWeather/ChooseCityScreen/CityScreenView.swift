//
//  View.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit
import Then
import SnapKit


class CityScreenView: UIView {

    let textField = UITextField().then {
        $0.placeholder = "Введите город"
        $0.backgroundColor = .white
    }
    
    let downloadBtn = UIButton().then {
        $0.setTitle("Узнать погоду", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tintColor = .blue
        $0.setTitleColor(.black, for: .selected)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textField)
        addSubview(downloadBtn)
        backgroundColor = .systemGray4
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        textField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalToSuperview().offset(100)
            $0.right.equalToSuperview().inset(30)
            $0.left.equalToSuperview().offset(30)
        }
        
        downloadBtn.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalToSuperview().inset(200)
            $0.left.right.equalToSuperview().inset(120)
        }
    }
    
}
