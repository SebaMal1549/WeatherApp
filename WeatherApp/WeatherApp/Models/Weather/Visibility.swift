//
//  Visibility.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Foundation

/// Visibility.
struct Visibility: Decodable, Equatable {

    // MARK: - Properties

    let metric: Metric

    // MARK: - CodingKeys

    enum CodingKeys: String, CodingKey {

        case metric = "Metric"

    }

}
