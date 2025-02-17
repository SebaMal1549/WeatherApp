//
//  ResponseValidatorTests.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

import Foundation
import Nimble
import Quick

@testable import WeatherApp

final class ResponseValidatorTests: QuickSpec {

    override class func spec() {
        var sut: ResponseValidator!

        beforeEach {
            sut = ResponseValidator()
        }

        afterEach {
            sut = nil
        }

        describe("Validate response") {
            it("When the response was validated correctly") {
                let url = URL(string: "https://example.com")!
                let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                try sut.validate(response)
            }

            it("When the server response is not in the range of 200 to 300") {
                let url = URL(string: "https://example.com")!
                let response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)!
                expect { try sut.validate(response) }.to(throwError(NetworkError.requestFailed(statusCode: 404)))
            }

            it("When the can't be casted to HTTPURLResponse") {
                expect { try sut.validate(nil) }.to(throwError(NetworkError.badResponse))
            }
        }
    }

}
