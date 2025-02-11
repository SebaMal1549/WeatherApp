//
//  Wind.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Foundation

/// Describes the wind parameters occurring at the selected location.
struct Wind: Decodable, Equatable {

    // MARK: - Properties

    let speed: Speed

    // MARK: - CodingKeys

    enum CodingKeys: String, CodingKey {

        case speed = "Speed"

    }

}
