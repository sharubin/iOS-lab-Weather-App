//
//  ViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit

class CityViewController: UIViewController {
    
    private let repository = ChooseCityRepositoriy()
    
    override func loadView() {
        super.loadView()
        
        self.view = CityScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view as? CityScreenView
        view?.downloadButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
     @objc private func buttonTapped() {
        let view = self.view as! CityScreenView
        let text = view.textField.text
        guard let text = text, !text.isEmpty else {
            alertFieldIsEmpty()
            return
        }
         repository.getWeatherForCity(name: text) { result in
             switch result {
             case .success(let response):
                 print(response)
                 let vc = DetailViewController()
                 vc.weather = response
                 self.navigationController?.pushViewController(vc, animated: true)
             case .failure(let error):
                 print(error)
                 self.alertNoData()
             }
         }
    }
    
    private func alertFieldIsEmpty() {
        let alert = UIAlertController(title: "Ошибка", message: "Город не введен", preferredStyle:  .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func alertNoData() {
        let alert = UIAlertController(title: "Ошибка", message: "Город введен не корректно, данные отсутсвуют", preferredStyle:  .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
}



