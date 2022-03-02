//
//  FavoriteControllerDelegateDataSorce.swift
//  newWeather
//
//  Created by Artsem Sharubin on 17.02.2022.
//

import UIKit

extension FavouriteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.identifier, for: indexPath) as! FavouriteTableViewCell
        cell.set(model: dataSource[indexPath.row])

        return cell
    }
}

extension FavouriteViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let actionDelete = UIContextualAction(style: .destructive, title: Strings.FavouriteView.delete) { [weak self] _, _, _ in
            self?.presenter.deleteByIndex(index: indexPath.row)
        }
        let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        return actions
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushTo(index: indexPath.row)
    }
}
