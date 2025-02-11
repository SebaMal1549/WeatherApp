//
//  Country.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Structure representing the country.
struct Country: Decodable, Equatable {

    // MARK: - Properties

    let name: String

    // MARK: - Coding Keys

    private enum CodingKeys: String, CodingKey {

        case name = "LocalizedName"

    }

}
