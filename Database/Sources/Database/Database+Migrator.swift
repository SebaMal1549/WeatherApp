//
//  Database+Migrator.swift
//  Database
//
//  Created by Sebastian Maludziński on 11/02/2025.
//

import Foundation
import GRDB

extension Database {

    // MARK: - Properties

    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()
        migrator.registerMigration("v1") { database in
            try createCityTable(database)
        }

        return migrator
    }

    // MARK: - Methods

    private func createCityTable(_ database: GRDB.Database) throws {
        try database.create(table: "cityEntity") { table in
            table.autoIncrementedPrimaryKey("id")
            table.column("name", .text).notNull()
            table.column("country", .text).notNull()
            table.column("area", .text).notNull()
            table.column("key", .text).notNull().unique()
            table.column("rank", .integer).notNull()
        }
    }

}
