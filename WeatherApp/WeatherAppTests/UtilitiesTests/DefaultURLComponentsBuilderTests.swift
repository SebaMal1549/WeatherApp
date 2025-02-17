//
//  DefaultURLComponentsBuilderTests.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation
import Nimble
import Quick

@testable import WeatherApp

final class DefaultURLComponentsBuilderTests: QuickSpec {

    override class func spec() {
        describe("Create URLComponents") {
            it("Create URLComponents") {
                let url = URL(string: "https://example.com")!
                let urlComponents = DefaultURLComponentsBuilder.create(for: url)
                expect { urlComponents?.queryItems?.count }.to(equal(2))
                expect { urlComponents?.queryItems }.to(equal([URLQueryItem(name: "apikey", value: "xgozIFzmA3lCWQZzIdkBuEM1G8C6Z6Vi"),
                                                               URLQueryItem(name: "language", value: "pl")]))
            }
        }
    }

}
