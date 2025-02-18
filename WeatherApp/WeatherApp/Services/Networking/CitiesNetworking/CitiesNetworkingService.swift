//
//  CitiesNetworkingService.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Networking for cities requests.
final class CitiesNetworkingService: CitiesNetworkingServiceType {

    // MARK: - Properties

    // Builder for cities requets.
    private let session: URLSessionType
    private let requestBuilder: CitiesURLRequestBuilderType
    private let validator: ResponseValidatorType

    // MARK: - Lifecycle

    init(
        session: URLSessionType = URLSession.shared,
        requestBuilder: CitiesURLRequestBuilderType = CitiesURLRequestBuilder(),
        validator: ResponseValidatorType = ResponseValidator()
    ) {
        self.session = session
        self.requestBuilder = requestBuilder
        self.validator = validator
    }

    // MARK: - API

    func fetchCities(searchText: String?) async throws -> [City] {
        guard let searchText = searchText else { return [] }
        let urlRequest = try requestBuilder.createRequest(with: searchText)
        let (data, response) = try await session.data(for: urlRequest)
        try validator.validate(response)

        do {
            let cities = try JSONDecoder().decode([City].self, from: data)
            return cities
        } catch {
            throw NetworkError.decodingFailed
        }
    }

}
