//
//  CitiesNetworkingService.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Networking for cities requests.
final class CitiesNetworkingService {
    
    // MARK: - Properties
    
    // Builder for cities requets.
    private let requestBuilder: CitiesURLRequestBuilder
    
    // MARK: - Lifecycle
    
    init(requestBuilder: CitiesURLRequestBuilder) {
        self.requestBuilder = requestBuilder
    }
    
    // MARK: - API
    
    func fetchCities(searchText: String) async throws -> [City] {
        let urlRequest = try requestBuilder.createRequest(with: searchText)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        try ResponseValidator.validate(response)
        
        let cities = try JSONDecoder().decode([City].self, from: data)
        return cities
    }
    
}
