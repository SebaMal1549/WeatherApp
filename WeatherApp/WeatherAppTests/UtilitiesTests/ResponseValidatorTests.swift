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
            context("Response from server is correct") {
                it("Response validated correctly") {
                    let url = URL(string: "https://example.com")!
                    let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                    try sut.validate(response)
                }
            }

            context("Response from server is wrong") {
                it("Validator thros server error") {
                    let url = URL(string: "https://example.com")!
                    let response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)!
                    expect(try sut.validate(response)).to(throwError(NetworkError.requestFailed(statusCode: 404)))
                }
            }

            context("Response from server is can't be catsed to HTTPURLResponse") {
                it("Validator thros response error") {
                    expect(try sut.validate(nil)).to(throwError(NetworkError.badResponse))
                }
            }
        }
    }

}
