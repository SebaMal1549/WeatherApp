//
//  WeatherDataURLRequestBuilder.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Foundation

/// The class responsible for creating requests for weather conditions.
final class WeatherDataURLRequestBuilder: WeatherDataURLRequestBuilderType {

    // MARK: - Properties

    var urlProvider: (_ cityKey: String) -> URL = { cityKey in
        URLProvider.createWeatherDataURL(with: cityKey)
    }

    var urlComponentsProvider: (URL) -> URLComponents? = { url in
        DefaultURLComponentsBuilder.create(for: url)
    }

    // MARK: - API

    /// The method responsible for creating a request for the selected city.
    func createRequest(with cityKey: String) throws -> URLRequest {
        let url = urlProvider(cityKey)
        var urlComponents = urlComponentsProvider(url)

        urlComponents?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "details", value: "true")
        ])

        guard let url = urlComponents?.url else { throw NetworkError.badURL }
        return URLRequest(url: url)
    }

}
