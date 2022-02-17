//
//  FavouritePresenter.swift
//  newWeather
//
//  Created by Artsem Sharubin on 14.02.2022.
//

import Foundation

protocol FavouritePresenterProtocol {
    
}

class FavouritePresenter {

    weak var view: FavouriteViewProtocol?

    init(view: FavouriteViewProtocol) {
        self.view = view

    }


}
