//
//  URLProvider.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Struct responsible for preparing the links needed to make requests.
struct URLProvider {
    
    // MARK: - Proeprties
    
    /// Base URL of server used to make requests.
    private static var baseURL: URL { URL(string: "https://dataservice.accuweather.com/")! }
    
    // MARK: - API
    
    /// URL needed to query the server for a list of cities.
    static var citiesURL: URL {
        baseURL.appendingPathComponent("locations/v1/search")
    }
    
}
