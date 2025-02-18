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

    /// Occurs when the downloaded data is invaid.
    case wrongData
    
    case decodingFailed

    // MARK: - Properties

    var localizedDescription: String {
        switch self {
        case .badURL: "Bad URL."
        case .badResponse: "Bad response."
        case .requestFailed(statusCode: let code): "Request failed with status code: \(code)."
        case .wrongData: "Downloaded data is invalid."
        case .decodingFailed: "Data decoding failed."
        }
    }

}
