//
//  URLProviderTests.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation
import Nimble
import Quick

@testable import WeatherApp

final class URLProviderTests: QuickSpec {

    override class func spec() {
        describe("Get URL") {
            context("Correct components of cities search url") {
                it("Return correct URL") {
                    expect { URLProvider.citiesURL }.to(equal(URL(string: "https://dataservice.accuweather.com/locations/v1/search")!))
                }
            }

            context("Correct components of city wetaher details url") {
                it("City weather details URL") {
                    expect { URLProvider.createWeatherDataURL(with: "Warszawa") }.to(equal(URL(string: "https://dataservice.accuweather.com/currentconditions/v1/Warszawa")!))
                }
            }
        }

    }

}
