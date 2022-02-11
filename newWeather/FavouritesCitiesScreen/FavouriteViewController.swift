//
//  FavouriteViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit

class FavouriteViewController: UIViewController {

    var favouriteModels = [Any]()
    
    override func loadView() {
        super.loadView()
        
        self.view = FavouriteScreenView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        let view = self.view as! FavouriteScreenView
        view.tableView.dataSource = self
        view.tableView.delegate = self
    }

}


extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as! FavouriteTableViewCell
        
        return cell
    }
    
    
}
