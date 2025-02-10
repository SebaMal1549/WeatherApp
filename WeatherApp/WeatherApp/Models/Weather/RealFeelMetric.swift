//
//  RealFeelMetric.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//


import Foundation

/// Includes information on values and units of measurement.
struct RealFeelMetric: Decodable, Equatable {
    
    // MARK: - Properties
    
    let value: Double
    let unit: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        
        case value = "Value"
        case unit = "Unit"
        
    }
    
}