//
//  ResponseValidator.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Struct responsible for simple response validation.
struct ResponseValidator {

    /// Basic response validation method.
    static func validate(_ response: URLResponse?) throws {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.badResponse
        }

        guard response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkError.requestFailed(statusCode: response.statusCode)
        }
    }

}
