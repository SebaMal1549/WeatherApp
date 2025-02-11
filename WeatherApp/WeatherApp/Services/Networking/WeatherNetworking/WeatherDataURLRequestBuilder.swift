//
//  WeatherDataURLRequestBuilder.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//


import Foundation

/// The class responsible for creating requests for weather conditions.
final class WeatherDataURLRequestBuilder {
    
    // MARK: - API
    
    /// The method responsible for creating a request for the selected city.
    func createRequest(with cityKey: String) throws -> URLRequest {
        var urlComponents = DefaultURLComponentsBuilder.createURLComponents(for: URLProvider.createWeatherDataURL(with: cityKey))
        
        urlComponents?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "details", value: "true")
        ])
        
        guard let url = urlComponents?.url else { throw NetworkError.badURL }
        return URLRequest(url: url)
    }
    
}
