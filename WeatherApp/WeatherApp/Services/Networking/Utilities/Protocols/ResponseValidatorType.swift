//
//  ResponseValidatorType.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation

// sourcery: AutoMockable
protocol ResponseValidatorType {

    func validate(_ response: URLResponse?) throws

}
