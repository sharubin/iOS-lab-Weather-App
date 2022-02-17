//
//  FavouriteScreenView.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit
import Then
import SnapKit

class FavouriteScreenView: UIView {
    
    let headingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = Strings.FavouriteView.header
        $0.font = Fonts.mainFontForDetailScreen
        $0.textColor = Colors.whiteColor
    }
    
    let tableView = UITableView().then  {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = false
        $0.register(FavouriteTableViewCell.self, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .clear
    }
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    private func setup() {
        addSubview(headingLabel)
        addSubview(tableView)
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
        setup()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        headingLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(headingLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }
}
