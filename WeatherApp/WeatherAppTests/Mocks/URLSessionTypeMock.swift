//
//  URLSessionTypeMock.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation

@testable import WeatherApp

final class URLSessionTypeMock: URLSessionType {

    // MARK: - Properties

    var mockData: Data?
    var mockResponse: URLResponse?
    var mockError: Error?

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = mockError {
            throw error
        }
        return (mockData ?? Data(), mockResponse ?? HTTPURLResponse())
    }

}
