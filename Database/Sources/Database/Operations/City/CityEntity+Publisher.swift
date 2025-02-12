//
//  CityEntity+Publisher.swift
//  Database
//
//  Created by Sebastian Maludziński on 12/02/2025.
//

import Combine
import GRDB
import Foundation

extension Database {

    public func citiesDidChangePublisher() -> AnyPublisher<[CityEntity], Error> {
        let observation = ValueObservation.tracking { database in
            return try CityEntity.fetchAll(database)
        }

        let publisher = observation.publisher(in: reader)
        return publisher.eraseToAnyPublisher()
    }

}
