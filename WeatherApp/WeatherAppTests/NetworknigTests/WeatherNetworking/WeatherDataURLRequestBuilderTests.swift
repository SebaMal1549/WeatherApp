//
//  WeatherDataURLRequestBuilderTests.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 14/02/2025.
//

import Foundation
import Nimble
import Quick

@testable import WeatherApp

final class WeatherDataURLRequestBuilderTests: QuickSpec {

    override class func spec() {
        var sut: WeatherDataURLRequestBuilder!

        beforeEach {
            sut = WeatherDataURLRequestBuilder()
        }

        afterEach {
            sut = nil
        }

        describe("create request") {
            context("request for cities created correctly") {
                it("Create cities request with search text") {
                    expect(try sut.createRequest(with: "21435").url?.absoluteString)
                        .to(equal("https://dataservice.accuweather.com/currentconditions/v1/21435?apikey=xgozIFzmA3lCWQZzIdkBuEM1G8C6Z6Vi&language=pl&details=true"))
                }
            }
        }
    }

}
