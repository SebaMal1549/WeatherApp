//
//  Temperature.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import UIKit
import Foundation

/// Rounded value in specified units. May be nil.
struct Temperature: Decodable, Equatable {

    // MARK: - Properties

    let metric: Metric

    // MARK: - CodingKeys

    enum CodingKeys: String, CodingKey {

        case metric = "Metric"

    }

}
