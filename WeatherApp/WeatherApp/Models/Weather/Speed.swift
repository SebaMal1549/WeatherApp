//
//  Speed.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//


import Foundation

/// Describes the wind speed occurring at the selected location.
struct Speed: Decodable, Equatable {
    
    // MARK: - Properties
    
    let metric: Metric
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        
        case metric = "Metric"
        
    }
    
}