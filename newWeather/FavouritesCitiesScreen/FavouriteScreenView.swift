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
        $0.text = "Избранные города"
        $0.font = UIFont(name: "Copperplate", size: 40)
    }
    
    let tableView = UITableView().then  {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = false
        $0.register(FavouriteTableViewCell.self, forCellReuseIdentifier: FavouriteTableViewCell.identifier)
        $0.layer.cornerRadius = 20
    }
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    private func viewAddSubview() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headingLabel)
        contentView.addSubview(tableView)
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray4
        viewAddSubview()
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
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        headingLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(headingLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(500)
        }
    }
    
}
