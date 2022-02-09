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
        $0.placeholder = "Enter the city"
       // $0.textAlignment = .center
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    let downloadButton = UIButton().then {
        $0.setTitle("Get the weather", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.tintColor = .blue
        $0.setTitleColor(.black, for: .selected)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        viewAddSubview()
        backgroundColor = UIColor(red: 59/255.0, green: 143/255.0, blue: 195/255.0, alpha: 1.0)
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
            $0.top.equalToSuperview().inset(200)
            $0.left.right.equalToSuperview().inset(120)
        }
    }
}
