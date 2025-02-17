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

    private let session: URLSessionType
    private let requestBuilder: WeatherDataURLRequestBuilderType
    private let validator: ResponseValidatorType

    // MARK: - Lifecycle

    init(
        session: URLSessionType = URLSession.shared,
        requestBuilder: WeatherDataURLRequestBuilderType = WeatherDataURLRequestBuilder(),
        validator: ResponseValidatorType = ResponseValidator()
    ) {
        self.session = session
        self.requestBuilder = requestBuilder
        self.validator = validator
    }

    // MARK: - API

    func fetchWeatherData(cityKey: String) async throws -> WeatherData {
        let urlRequest = try requestBuilder.createRequest(with: cityKey)
        let (data, response) = try await session.data(for: urlRequest)
        try validator.validate(response)
        
        do {
            let weatherData = try JSONDecoder().decode([WeatherData].self, from: data)
            guard let details = weatherData.first else { throw NetworkError.wrongData }
            return details
        } catch {
            throw NetworkError.decodingFailed
        }

//        if let weatherData = try JSONDecoder().decode([WeatherData].self, from: data).first {
//            return weatherData
//        } else {
//            throw NetworkError.decodingFailed
//        }
    }

}
