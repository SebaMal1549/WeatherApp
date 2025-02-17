//
//  CitiesURLRequestBuilderTests.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation
import Nimble
import Quick

@testable import WeatherApp

final class CitiesURLRequestBuilderTests: QuickSpec {

    override class func spec() {
        var sut: CitiesURLRequestBuilder!

        beforeEach {
            sut = CitiesURLRequestBuilder()
        }

        afterEach {
            sut = nil
        }

        describe("Create cities request") {
            it("Create cities request with search text") {
                expect {
                    try sut.createRequest(with: "Warszawa").url?.absoluteString
                }
                .to(equal("https://dataservice.accuweather.com/locations/v1/search?apikey=xgozIFzmA3lCWQZzIdkBuEM1G8C6Z6Vi&language=pl&q=Warszawa"))
            }
        }

    }
    
}
