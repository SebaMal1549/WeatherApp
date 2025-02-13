//
//  Database.swift
//  Database
//
//  Created by Sebastian Maludziński on 11/02/2025.
//

import Foundation
import GRDB

public struct Database: Sendable {

    // MARK: - Properties

    public let writer: DatabaseWriter
    public var reader: DatabaseReader { writer }

    // MARK: - Lifecycle

    public init(writer: DatabaseWriter) throws {
        self.writer = writer
        try migrator.migrate(writer)
    }

}
