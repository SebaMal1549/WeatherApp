//
//  DefaultURLComponentsBuilder.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// The class responsible for creating the basic URLComponents.
struct DefaultURLComponentsBuilder {
    
    // MARK: - API
    
    /// Creates and returns basic URLComponents.
    static func createURLComponents(for url: URL) -> URLComponents? {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        urlComponents?.queryItems = [
            URLQueryItem(name: "apikey", value: Constants.apiKey),
            URLQueryItem(name: "language", value: "pl")
        ]
        
        return urlComponents
    }
    
}
