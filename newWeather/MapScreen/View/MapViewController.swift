//
//  MapViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 19.02.2022.
//

import UIKit
import GoogleMaps

protocol MapViewProtocol: AnyObject {
    func pushTo(controller: UIViewController)
}

class MapViewController: UIViewController {
     
    var presenter: MapPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MapPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
    }
    
    private func setup() {
        GMSServices.provideAPIKey(Keys.googleKey)
        
        let camera = GMSCameraPosition.camera(withLatitude: 53.91, longitude: 30.32, zoom: 5.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        mapView.delegate = self
        
        let array = presenter.obtainCities()
        for model in array {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: model.lat, longitude: model.lon)
            marker.title = "\(model.city)"
            marker.map = mapView
        }
    }
    
}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        presenter.getWeather(lat: String(coordinate.latitude), lon: String(coordinate.longitude))
    }
}

extension MapViewController: MapViewProtocol {
    func pushTo(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
}
