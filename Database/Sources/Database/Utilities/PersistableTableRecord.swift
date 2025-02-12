//
//  PersistableTableRecord.swift
//  Database
//
//  Created by Sebastian Maludziński on 12/02/2025.
//

import GRDB
import Foundation

typealias PersistableTableRecord = Identifiable &
    Codable &
    Sendable &
    EncodableRecord &
    FetchableRecord &
    TableRecord &
    PersistableRecord
