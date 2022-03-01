//
//  ViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit
import CoreLocation

class CityViewController: UIViewController {

    let managerLocation = CLLocationManager()

    private let repository: CityRepositoryProtocol
    private var rootView: CityScreenView {
        self.view as! CityScreenView
    }

    init(repository: CityRepositoryProtocol = ChooseCityRepository()) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        self.view = CityScreenView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        managerLocation.requestWhenInUseAuthorization()

    }

     @objc private func buttonTapped() {
        let text = rootView.textField.text
        guard let text = text, !text.isEmpty else {
            alertFieldIsEmpty()
            return
        }
         repository.getWeatherForCity(name: text) { [weak self] result in
             switch result {
             case .success(let response):
                 let nextController = DetailViewController(weather: response)
                 self?.navigationController?.pushViewController(nextController, animated: true)
             case .failure(let error):
                 print(error)
                 self?.alertNoData()
             }
         }
    }

    @objc private func buttonFavouriteTapped() {
        self.navigationController?.pushViewController(FavouriteViewController(), animated: true)
    }

    @objc private func buttonMapTapped() {
        self.navigationController?.pushViewController(MapViewController(), animated: true)
    }

    private func setup() {
        rootView.downloadButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        rootView.toFavouriteButton.addTarget(self, action: #selector(buttonFavouriteTapped), for: .touchUpInside)
        rootView.toMapButton.addTarget(self, action: #selector(buttonMapTapped), for: .touchUpInside)
    }

    private func alertFieldIsEmpty() {
        let alert = UIAlertController(title: Strings.CityView.error, message: Strings.CityView.emptyText, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: Strings.CityView.okString, style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }

    private func alertNoData() {
        let alert = UIAlertController(title: Strings.CityView.error, message: Strings.CityView.noData, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: Strings.CityView.okString, style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
}
