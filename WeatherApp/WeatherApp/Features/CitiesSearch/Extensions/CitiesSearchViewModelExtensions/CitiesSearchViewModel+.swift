//
//  CitiesSearchViewModel+CitiesChangedEvent.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 12/02/2025.
//

import Foundation

extension CitiesSearchViewModel {

    enum CitiesChangedEvent {

        case cities([City])
        case savedCities([City])

    }

}
