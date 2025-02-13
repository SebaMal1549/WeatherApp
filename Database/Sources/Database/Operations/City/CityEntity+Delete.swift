//
//  CityEntity+Delete.swift
//  Database
//
//  Created by Sebastian Maludziński on 12/02/2025.
//

import GRDB
import Foundation

extension Database {

    public func deleteCity(with key: String) throws {
        let _ = try writer.write { database in
            try CityEntity.deleteOne(database, key: ["key": key])
        }
    }

}
