//
//  ViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 31.01.2022.
//

import UIKit

class CityViewController: UIViewController {

    override func loadView() {
       super.loadView()
        
        self.view = CityScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fsv = self.view as? CityScreenView
        fsv?.downloadBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        
        let сsv = self.view as! CityScreenView
        let text = сsv.textField.text
        guard let text = text, !text.isEmpty else {
            let alert = UIAlertController(title: "Ошибка", message: "Город не введен", preferredStyle:  .alert)
            let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(actionOK)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
          NetworkEngine.request(endpoint: CurrentEndpoint.getCurrenWeather(city: text)) { (result: Result<WeatherData, Error>) in
              switch result {
              case .success(let response):
                  print(response)
                  let vc = DetailVC()
                  vc.weather = response
                  self.navigationController?.pushViewController(vc, animated: true)
              case .failure(let error):
                  print(error)
                  let alert = UIAlertController(title: "Ошибка", message: "Город введен не корректно, данные отсутсвуют", preferredStyle:  .alert)
                  let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
                  alert.addAction(actionOK)
                  self.present(alert, animated: true, completion: nil)
              }
          }
    }
}


extension CityViewController: UITextFieldDelegate {
    
}
