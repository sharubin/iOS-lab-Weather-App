//
//  MapView.swift
//  newWeather
//
//  Created by Artsem Sharubin on 23.02.2022.
//

import UIKit
import GoogleMaps

class MapView: UIView {
    
    let ToMyLocationButton = UIButton().then {
        $0.setBackgroundImage(UIImage(systemName: "location.square.fill"), for: .normal)
    }
    
    let mapView = GMSMapView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        addSubview(mapView)
        mapView.addSubview(ToMyLocationButton)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        

        ToMyLocationButton.snp.makeConstraints {
            $0.width.height.equalTo(45)
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}



