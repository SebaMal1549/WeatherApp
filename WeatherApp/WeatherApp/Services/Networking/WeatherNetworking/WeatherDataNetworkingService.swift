//
//  WeatherDataNetworkingService.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//


import Foundation

/// Networking set up for city-related enquiries.
final class WeatherDataNetworkingService: WeatherDataNetworkingServiceType {
    
    // MARK: - Properties
    
    // Builder for cities requets.
    private let requestBuilder = WeatherDataURLRequestBuilder()
    
    // MARK: - API
    
    func fetchWeatherData(cityKey: String) async throws -> WeatherData {
        let urlRequest = try requestBuilder.createRequest(with: cityKey)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        try ResponseValidator.validate(response)
        
        if let weatherData = try JSONDecoder().decode([WeatherData].self, from: data).first {
            return weatherData
        } else {
            throw NetworkError.wrongData
        }
    }
    
}
