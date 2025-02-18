//
//  WeatherDataURLRequestBuilderType.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation

// sourcery: AutoMockable
protocol WeatherDataURLRequestBuilderType {

    // MARK: - Properties

    var urlProvider: (_ cityKey: String) -> URL { get set }
    var urlComponentsProvider: (URL) -> URLComponents? { get set }

    // MARK: - API

    func createRequest(with cityKey: String) throws -> URLRequest

}
