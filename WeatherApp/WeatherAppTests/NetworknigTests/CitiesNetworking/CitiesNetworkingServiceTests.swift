//
//  CitiesNetworkingServiceTests.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 13/02/2025.
//

// swiftlint:disable function_body_length

import Foundation
import Nimble
import Quick

@testable import WeatherApp

final class CitiesNetworkingServiceTests: AsyncSpec {

    override class func spec() {

        var session: URLSessionTypeMock!
        var validator: ResponseValidatorTypeMock!
        var requestBuilder: CitiesURLRequestBuilderTypeMock!
        var sut: CitiesNetworkingService!
        var url: URL!

        beforeEach {
            session = URLSessionTypeMock()
            validator = ResponseValidatorTypeMock()
            requestBuilder = CitiesURLRequestBuilderTypeMock()
            url = URL(string: "https://mockapi.com/")!
            sut = CitiesNetworkingService(
                session: session,
                requestBuilder: requestBuilder,
                validator: validator
            )
        }

        afterEach {
            session = nil
            validator = nil
            requestBuilder = nil
            url = nil
            sut = nil
        }

        describe("User fetch cities with search text") {
            context("Cities have been correctly downloaded and decoded") {
                beforeEach {
                    let mockResponse = HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: nil,
                        headerFields: nil
                    )

                    session.mockResponse = mockResponse
                    session.mockData = CitiesDataBuilder.getCitiesData()
                    requestBuilder.createRequestWithSerachTextStringURLRequestReturnValue = URLRequest(url: url)

                    await expect { try await sut.fetchCities(searchText: "Warszawa") }
                        .to(equal([City(
                            area: WeatherApp.AdministrativeArea(name: "Mazowieckie"),
                            country: WeatherApp.Country(name: "Polska"),
                            key: "274663",
                            name: "Warszawa",
                            rank: 20)
                        ]))z
                }

                it("returns list of cities") {
                    expect(validator.validateResponseURLResponseVoidCallsCount).to(equal(1))
                    expect(validator.validateResponseURLResponseVoidCalled).to(equal(true))
                    expect(requestBuilder.createRequestWithSerachTextStringURLRequestCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithSerachTextStringURLRequestCalled).to(equal(true))
                }
            }

            context("Cities haven't been correctly downloaded and decoded") {
                beforeEach {
                    let mockResponse = HTTPURLResponse(
                        url: url,
                        statusCode: 404,
                        httpVersion: nil,
                        headerFields: nil
                    )

                    session.mockResponse = mockResponse
                    validator.validateResponseURLResponseVoidThrowableError = NetworkError.requestFailed(statusCode: 404)
                    requestBuilder.createRequestWithSerachTextStringURLRequestReturnValue = URLRequest(url: url)

                    await expect { try await sut.fetchCities(searchText: "Warszawa") }
                        .to(throwError(NetworkError.requestFailed(statusCode: 404)))
                }

                it("throws an request error") {
                    expect(validator.validateResponseURLResponseVoidCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithSerachTextStringURLRequestCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithSerachTextStringURLRequestCalled).to(equal(true))
                }
            }

            context("Cities have been downloaded correctly, but it has been incorrectly decoded") {
                beforeEach {
                    let mockResponse = HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: nil,
                        headerFields: nil
                    )

                    session.mockResponse = mockResponse
                    requestBuilder.createRequestWithSerachTextStringURLRequestReturnValue = URLRequest(url: url)

                    await expect { try await sut.fetchCities(searchText: "Warszawa") }
                        .to(throwError(NetworkError.decodingFailed))
                }

                it("throws an decoding error") {
                    expect(validator.validateResponseURLResponseVoidCallsCount).to(equal(1))
                    expect(validator.validateResponseURLResponseVoidCalled).to(equal(true))
                    expect(requestBuilder.createRequestWithSerachTextStringURLRequestCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithSerachTextStringURLRequestCalled).to(equal(true))
                }
            }
        }

    }

}
