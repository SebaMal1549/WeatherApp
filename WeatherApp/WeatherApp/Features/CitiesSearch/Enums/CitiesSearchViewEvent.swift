//
//  CitiesSearchViewEvent.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Foundation

/// User triggered events on the `CitiesSearchView` view.
enum CitiesSearchViewEvent: Equatable {
    
    /// Occurs when the user clicks on a cell representing a city.
    case userTappedCityCell(City)
    
    /// Occurs when the user types smth in textfield.
    case userEditedSearchText(String?)
    
}
