//
//  CitiesSearchViewEvent.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Foundation

extension CitiesSearchView {

    enum Event: Equatable {

        case userTappedCityCell(City)
        case userDeletedSavedCity(City)
        case userEditedSearchText(String?)

    }

}
