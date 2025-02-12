//
//  CityEntity+Fetch.swift
//  Database
//
//  Created by Sebastian Maludziński on 12/02/2025.
//

import GRDB
import Foundation

extension Database {

    public func fetchCities() async throws -> [CityEntity] {
        try await reader.read { database in
            try CityEntity.fetchAll(database)
        }
    }

    func fetchCity(with key: String) async throws -> CityEntity? {
        try await reader.read { database in
            try CityEntity.fetchOne(database, sql: "SELECT * FROM cityEntity WHERE key = ?", arguments: [key])
        }
    }

}
