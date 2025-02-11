//
//  City.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Structure representing the city.
struct City: Comparable, Decodable, Equatable {

    // MARK: - Properties

    /// Administrative area of the city.
    let area: AdministrativeArea

    /// Country to which city belongs.
    let country: Country

    /// Location key, needed to download weather data for the selected location.
    let key: String

    /// Name of the city.
    let name: String

    /// Rank of the city.
    let rank: Int

    // MARK: - Comparable

    static func < (lhs: City, rhs: City) -> Bool {
        lhs.rank < rhs.rank
    }

    // MARK: - CodingKeys

    private enum CodingKeys: String, CodingKey {

        case area = "AdministrativeArea"
        case country = "Country"
        case key = "Key"
        case name = "LocalizedName"
        case rank = "Rank"

    }

}
