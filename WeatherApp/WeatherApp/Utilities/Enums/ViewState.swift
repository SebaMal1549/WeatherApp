//
//  ViewState.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 07/02/2025.
//

import Foundation

/// The state that a view can take.
enum ViewState {
    
    /// Occurs when the data to correctly load the view is retrieved.
    case loading
    
    /// Occurs when the data for a valid view has been downloaded and the view has been built.
    case correctlyLoaded
    
}
