//
//  NetworkError.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Custom networking erros.
enum NetworkError: Error {
    
    /// Occurs when the url is invalid.
    case badURL
    
    /// Occurs when the response is invalid.
    case badResponse
    
    /// Occurs when the request faild.
    case requestFailed(statusCode: Int)
    
    // MARK: - Properties
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "Bad URL."
        case .badResponse:
            return "Bad response."
        case .requestFailed(statusCode: let code):
            return "Request failed with status code: \(code)."
        }
    }
    
}
