//
//  MapViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 19.02.2022.
//

import UIKit
import GoogleMaps
import CoreLocation

protocol MapViewProtocol: AnyObject {
    func pushTo(controller: UIViewController)
    func setData(data: [Marker])
}

class MapViewController: UIViewController {
    
    var rootView: MapView {
        self.view as! MapView
    }
    var arrayMarker = [Marker]()
    var presenter: MapPresenterProtocol!
    var mapView: GMSMapView {
        rootView.mapView
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = MapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MapPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setup()
    }
    
    private func setup() {
        setupCurrentLocation()
        setupGoogleMap()
        rootView.ToMyLocationButton.addTarget(self, action: #selector(goToMyLocation), for: .touchUpInside)
        putMarkersOnMap()
        setupNavigationBar()
    }
    
    private func putMarkersOnMap() {
        for model in arrayMarker {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: model.lat, longitude: model.lon)
            marker.title = "\(model.name)"
            marker.snippet = String(format: Strings.MapView.minMaxTemp, model.minTemp, model.maxTemp)
            marker.map = mapView
        }
    }
    
    private func setupCurrentLocation() {
        presenter.managerLocation.delegate = self
        presenter.managerLocation.startUpdatingLocation()
    }
    
    private func setupGoogleMap() {
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.tintColor = Colors.whiteColor
    }
    
    private func createCustomMarker(lat: Double, lon: Double) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = "MyLocation"
        marker.icon = UIImage(named: "marker")
        marker.map = mapView
    }
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    @objc func goToMyLocation() {
        guard let lat = presenter.managerLocation.location?.coordinate.latitude,
              let lon = presenter.managerLocation.location?.coordinate.longitude else { return }
        let camera = GMSCameraPosition.camera(withLatitude: lat ,longitude: lon , zoom: 12)
        mapView.animate(to: camera)
        createCustomMarker(lat: lat, lon: lon)
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
    
    func setData(data: [Marker]) {
        arrayMarker = data
    }
}
