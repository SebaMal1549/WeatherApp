//
//  CityEntity.swift
//  Database
//
//  Created by Sebastian Maludziński on 11/02/2025.
//

import Foundation
import GRDB

public struct CityEntity: PersistableTableRecord {

    // MARK: - Properties

    public var id: Int64?
    public var name: String
    public var country: String
    public var area: String
    public var key: String
    public var rank: Int

    // MARK: - Lifecycle

    public init(
        id: Int64? = nil,
        name: String,
        country: String,
        area: String,
        key: String,
        rank: Int
    ) {
        self.id = id
        self.name = name
        self.country = country
        self.area = area
        self.key = key
        self.rank = rank
    }

}
