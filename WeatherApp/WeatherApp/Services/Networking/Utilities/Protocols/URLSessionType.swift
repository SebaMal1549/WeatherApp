//
//  URLSessionProtocol.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation

protocol URLSessionType {

    func data(for request: URLRequest) async throws -> (Data, URLResponse)

}
