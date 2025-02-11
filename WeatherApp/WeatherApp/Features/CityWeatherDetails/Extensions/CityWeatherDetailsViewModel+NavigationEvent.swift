//
//  CityWeatherDetailsViewModel+NavigationEvent.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 11/02/2025.
//

import Foundation

extension CityWeatherDetailsViewModel {
    
    enum NavigationEvent {
        
        case showAlert(title: String, message: String)
        case finish
        
    }
    
}
