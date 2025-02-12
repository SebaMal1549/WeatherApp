//
//  CityMapper.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 12/02/2025.
//

import Database
import Foundation

struct CityMapper {

    static func map(_ city: City) -> CityEntity {
        CityEntity(
            name: city.name,
            country: city.country.name,
            area: city.area.name,
            key: city.key,
            rank: city.rank
        )
    }

    static func map(_ city: CityEntity) -> City {
        City(
            area: AdministrativeArea(name: city.area),
            country: Country(name: city.area),
            key: city.key,
            name: city.name,
            rank: city.rank
        )
    }

}
