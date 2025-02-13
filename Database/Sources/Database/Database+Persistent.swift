//
//  Database+Persistent.swift
//  Database
//
//  Created by Sebastian Maludziński on 11/02/2025.
//

import Foundation
import GRDB

extension Database {

    public static let shared = makeShared()

    // MARK: - Methods

    private static func makeShared() -> Database {
        do {
            let fileManager = FileManager()
            let folder = try fileManager.url(
                for: .applicationSupportDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true
            ).appendingPathComponent("database", isDirectory: true)

            try fileManager.createDirectory(at: folder, withIntermediateDirectories: true)
            let databaseUrl = folder.appendingPathComponent("db.sqlite")
            let writer = try DatabasePool(path: databaseUrl.path)
            let database = try Database(writer: writer)
            return database
        } catch {
            fatalError("Database error: \(error)")
        }
    }

}
