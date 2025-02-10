//
//  AnyWeatherDataNetworkingService.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Foundation

/// A protocol describing networking for a city weather details service.
protocol AnyWeatherDataNetworkingService {
    
    /// The method responsible for retrieving information on weather conditions in the selected city.
    func fetchWeatherData(cityKey: String) async throws -> WeatherData
    
}
