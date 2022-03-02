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
    func setCoordinate(coordinate: CLLocationCoordinate2D)
    func setupMarker()
    func enableMap(bool: Bool)
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
    var markers = [GMSMarker]()
    var usersCoordinate: CLLocationCoordinate2D?

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
        rootView.toMyLocationButton.addTarget(self, action: #selector(goToMyLocation), for: .touchUpInside)
        rootView.zoomForMarkersButton.addTarget(self, action: #selector(zoomForMarkers), for: .touchUpInside)
        putMarkersOnMap()
        setupNavigationBar()
    }

    func putMarkersOnMap() {
        mapView.clear()
        for model in arrayMarker {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: model.lat, longitude: model.lon)
            marker.title = "\(model.name)"
            marker.snippet = String(format: Strings.MapView.minMaxTemp, model.minTemp, model.maxTemp)
            marker.map = mapView
            markers.append(marker)
        }
        createCustomMarker()
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
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward.circle.fill")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward.circle.fill")
        navigationController?.navigationBar.backItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
    }

    private func createCustomMarker() {
        presenter.getCoordinates()
    }

    @objc private func zoomForMarkers() {
        var bounds = GMSCoordinateBounds()
        for marker in markers {
            bounds = bounds.includingCoordinate(marker.position)
        }
        mapView.animate(with: GMSCameraUpdate.fit(bounds, with: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)))
    }
}

extension MapViewController: CLLocationManagerDelegate {

    @objc func goToMyLocation() {
        presenter.getCoordinates()
        guard let lat = usersCoordinate?.latitude,
              let lon = usersCoordinate?.longitude else { return }
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 12)
        mapView.animate(to: camera)
    }
}

extension MapViewController: GMSMapViewDelegate {

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        enableMap(bool: false)
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

    func setCoordinate(coordinate: CLLocationCoordinate2D) {
        self.usersCoordinate = coordinate
        setupMarker()
    }

    func setupMarker() {
        let marker = GMSMarker()
        guard let lat = usersCoordinate?.latitude,
              let lon = usersCoordinate?.longitude else { return }
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = "MyLocation"
        marker.icon = UIImage(named: "marker")
        marker.map = mapView
    }

    func enableMap(bool: Bool) {
        if bool {
            rootView.isUserInteractionEnabled = true
        } else {
            rootView.isUserInteractionEnabled = false
        }
    }
}
