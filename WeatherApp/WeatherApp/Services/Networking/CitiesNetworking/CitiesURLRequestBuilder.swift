//
//  CitiesURLRequestBuilder.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

final class CitiesURLRequestBuilder: CitiesURLRequestBuilderType {

    // MARK: - API

    func createRequest(with serachText: String) throws -> URLRequest {
        var urlComponents = DefaultURLComponentsBuilder.create(for: URLProvider.citiesURL)

        urlComponents?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "q", value: serachText)
        ])

        guard let url = urlComponents?.url else { throw NetworkError.badURL }
        return URLRequest(url: url)
    }

}
