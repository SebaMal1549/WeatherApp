//
//  CitiesSearchViewEvent.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Foundation

extension CitiesSearchView {
    
    enum Event: Equatable {
        
        /// Occurs when the user clicks on a cell representing a city.
        case userTappedCityCell(City)
        
        /// Occurs when the user types smth in textfield.
        case userEditedSearchText(String?)
        
    }
    
}
