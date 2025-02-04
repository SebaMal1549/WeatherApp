//
//  URLRequestBuilder.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

final class CitiesURLRequestBuilder {
    
    // MARK: - Properties
    
    private let urlComponentsBuilder = DefaultURLComponentsBuilder()
    
    // MARK: - API
    
    func createRequest(with serachText: String) throws -> URLRequest {
        var urlComponents = urlComponentsBuilder.createURLComponents(for: URLProvider.citiesURL)
        
        urlComponents?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "q", value: serachText)
        ])
        
        guard let url = urlComponents?.url else { throw NetworkError.badURL }
        return URLRequest(url: url)
    }
    
}
