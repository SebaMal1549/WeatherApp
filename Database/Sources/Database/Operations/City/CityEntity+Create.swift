//
//  CityEntity+Create.swift
//  Database
//
//  Created by Sebastian Maludziński on 12/02/2025.
//

import GRDB
import Foundation

extension Database {

    public func createCity(_ city: CityEntity) async throws {
        guard try await fetchCity(with: city.key) == nil else { return }
        try await writer.write { database in
            try city.insert(database)
        }
    }

}
