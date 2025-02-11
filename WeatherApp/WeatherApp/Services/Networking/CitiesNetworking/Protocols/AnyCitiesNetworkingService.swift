//
//  AnyCitiesNetworkingService.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Foundation

/// A protocol describing networking for a city search service.
protocol CitiesNetworkingServiceType {
    
    /// The method responsible for retrieving the list of cities matching the search text.
    func fetchCities(searchText: String?) async throws -> [City]
    
}
