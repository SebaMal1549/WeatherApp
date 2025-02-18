//
//  CitiesURLRequestBuilderType.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 14/02/2025.
//

import Foundation

// sourcery: AutoMockable
protocol CitiesURLRequestBuilderType {

    func createRequest(with serachText: String) throws -> URLRequest

}
