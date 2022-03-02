//
//  ExtensionString.swift
//  newWeather
//
//  Created by Artsem Sharubin on 28.02.2022.
//

import Foundation

extension String {
    func localizedLanguage() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
