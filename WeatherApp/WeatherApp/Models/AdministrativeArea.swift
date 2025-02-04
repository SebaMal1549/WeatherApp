//
//  AdministrativeArea.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import Foundation

/// Structure representing the administrative area.
struct AdministrativeArea: Decodable, Equatable {
    
    // MARK: - Properties
    
    /// Name of the administrative area.
    let name: String
    
    // MARK: - Coding Keys
    
    private enum CodingKeys: String, CodingKey {
        
        case name = "LocalizedName"
        
    }
    
}
