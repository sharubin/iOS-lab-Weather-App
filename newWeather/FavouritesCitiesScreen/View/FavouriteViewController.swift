//
//  FavouriteViewController.swift
//  newWeather
//
//  Created by Artsem Sharubin on 11.02.2022.
//

import UIKit

protocol FavouriteViewProtocol: AnyObject {
    func setData(data: [FavouriteWeatherCellModel])
    func pushTo(controller: UIViewController)
}

class FavouriteViewController: UIViewController {

    private var rootView: FavouriteScreenView {
        self.view as! FavouriteScreenView
    }
    var presenter: FavouritePresenterProtocol!
    var dataSource = [FavouriteWeatherCellModel]()

    override func loadView() {
        super.loadView()

        self.view = FavouriteScreenView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter.fetchData()
    }

    private func setup() {
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        presenter = FavouritePresenter(view: self)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = view.backgroundColor
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward.square")
        navigationController?.navigationBar.tintColor = .white
    }
}

extension FavouriteViewController: FavouriteViewProtocol {

    func pushTo(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }

    func setData(data: [FavouriteWeatherCellModel]) {
        dataSource = data
        rootView.tableView.reloadData()
    }
}
