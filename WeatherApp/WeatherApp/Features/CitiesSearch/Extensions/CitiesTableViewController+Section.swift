//
//  CitiesTableViewController+Section.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 11/02/2025.
//

import Foundation

extension CitiesTableViewController {

    enum Section: Int {

        case cities
        case savedCities

        // MARK: - Properties

        var title: String {
            switch self {
            case .cities: "Miasta"
            case .savedCities: "Ostatnio sprawdzane"
            }
        }

    }

}
