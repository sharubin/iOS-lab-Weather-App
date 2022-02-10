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
        $0.placeholder = Strings.CityView.placeholderText
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.backgroundColor = Colors.whiteColor
    }
    
    let downloadButton = UIButton().then {
        $0.setTitle(Strings.CityView.buttonText, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = Colors.whiteColor
        $0.layer.cornerRadius = 10
        $0.tintColor = .blue
        $0.setTitleColor(.black, for: .selected)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewAddSubview()
        backgroundColor = Colors.goodWeatherColor
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewAddSubview() {
        addSubview(textField)
        addSubview(downloadButton)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        textField.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalToSuperview().offset(100)
            $0.right.equalToSuperview().inset(30)
            $0.left.equalToSuperview().offset(30)
        }
        
        downloadButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(textField.snp.bottom).offset(50)
            $0.left.right.equalToSuperview().inset(120)
        }
    }
}
