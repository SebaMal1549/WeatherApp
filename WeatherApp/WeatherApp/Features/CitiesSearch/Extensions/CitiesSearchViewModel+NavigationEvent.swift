//
//  CitiesSearchViewModel+NavigationEvent.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 11/02/2025.
//

import Foundation

extension CitiesSearchViewModel {
    
    enum NavigationEvent {
        
        case goToWeatherDetails(City)
        case showAlert(title: String, message: String)
        case finish
        
    }
    
}
