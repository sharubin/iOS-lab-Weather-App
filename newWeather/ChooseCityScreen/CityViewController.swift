//
//  ViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit

class CityViewController: UIViewController {
    
    private let repository = ChooseCityRepositoriy()
    var rootView: CityScreenView {
        self.view as! CityScreenView
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = CityScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
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
                 let vc = DetailViewController()
                 vc.weather = response
                 self?.navigationController?.pushViewController(vc, animated: true)
             case .failure(let error):
                 print(error)
                 self?.alertNoData()
             }
         }
    }
    
    @objc private func buttonFavouriteTapped() {
        self.navigationController?.pushViewController(FavouriteViewController(), animated: true)
    }
    
    private func setup() {
        rootView.downloadButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        rootView.toFavouriteButton.addTarget(self, action: #selector(buttonFavouriteTapped), for: .touchUpInside)
    }
    
    private func alertFieldIsEmpty() {
        let alert = UIAlertController(title: Strings.CityView.error, message: Strings.CityView.emptyText, preferredStyle:  .alert)
        let actionOK = UIAlertAction(title: Strings.CityView.okString, style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func alertNoData() {
        let alert = UIAlertController(title: Strings.CityView.error, message: Strings.CityView.noData, preferredStyle:  .alert)
        let actionOK = UIAlertAction(title: Strings.CityView.okString, style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
}



