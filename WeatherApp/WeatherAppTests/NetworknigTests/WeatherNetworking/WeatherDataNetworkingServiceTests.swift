//
//  WeatherDataNetworkingServiceTests.swift
//  WeatherAppTests
//
//  Created by Sebastian Maludziński on 14/02/2025.
//

//swiftlint:disable function_body_length

import Foundation
import Nimble
import Quick

@testable import WeatherApp

final class WeatherDataNetworkingServiceTests: AsyncSpec {

    override class func spec() {
        var validator: ResponseValidatorTypeMock!
        var session: URLSessionTypeMock!
        var requestBuilder: WeatherDataURLRequestBuilderTypeMock!
        var url: URL!
        var sut: WeatherDataNetworkingService!

        beforeEach {
            session = URLSessionTypeMock()
            validator = ResponseValidatorTypeMock()
            requestBuilder = WeatherDataURLRequestBuilderTypeMock()
            url = URL(string: "https://mockapi.com/")!
            sut = WeatherDataNetworkingService(
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

        describe("User fetch city weather data details with search text") {
            context("City weather data details have been correctly downloaded and decoded") {
                beforeEach {
                    let mockResponse = HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: nil,
                        headerFields: nil
                    )

                    session.mockResponse = mockResponse
                    session.mockData = WeatherDetailsDataBuilder.getWeatherDetailsData()
                    requestBuilder.createRequestWithCityKeyStringURLRequestReturnValue = URLRequest(url: url)
                }

                it("returns list of cities") {
                    await expect { try await sut.fetchWeatherData(cityKey: "2746") }
                        .to(equal(WeatherData(weatherText: "Bezchmurnie",
                                              relativeHumidity: 87,
                                              temperature: Temperature(metric: Metric(value: 0.0, unit: "C")),
                                              realFeelTemperature: RealFeelTemperature(metric: RealFeelMetric(value: -2.4, unit: "C")),
                                              wind: Wind(speed: Speed(metric: Metric(value: 10.2, unit: "km/h"))),
                                              visibility: Visibility(metric: Metric(value: 24.1, unit: "km")))
                        ))
                    expect(validator.validateResponseURLResponseVoidCallsCount).to(equal(1))
                    expect(validator.validateResponseURLResponseVoidCalled).to(equal(true))
                    expect(requestBuilder.createRequestWithCityKeyStringURLRequestCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithCityKeyStringURLRequestCalled).to(equal(true))
                }
            }

            context("City weather data haven't been correctly downloaded and decoded") {
                beforeEach {
                    let mockResponse = HTTPURLResponse(
                        url: url,
                        statusCode: 404,
                        httpVersion: nil,
                        headerFields: nil
                    )

                    session.mockResponse = mockResponse
                    validator.validateResponseURLResponseVoidThrowableError = NetworkError.requestFailed(statusCode: 404)
                    requestBuilder.createRequestWithCityKeyStringURLRequestReturnValue = URLRequest(url: url)
                }

                it("throws an request error") {
                    await expect { try await sut.fetchWeatherData(cityKey: "2746") }
                        .to(throwError(NetworkError.requestFailed(statusCode: 404)))
                    expect(validator.validateResponseURLResponseVoidCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithCityKeyStringURLRequestCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithCityKeyStringURLRequestCalled).to(equal(true))
                }
            }

            context("City weather data have been downloaded correctly, but it has been incorrectly decoded") {
                beforeEach {
                    let mockResponse = HTTPURLResponse(
                        url: url,
                        statusCode: 200,
                        httpVersion: nil,
                        headerFields: nil
                    )

                    session.mockResponse = mockResponse
                    requestBuilder.createRequestWithCityKeyStringURLRequestReturnValue = URLRequest(url: url)
                }

                it("throws an decoding error") {
                    await expect { try await sut.fetchWeatherData(cityKey: "2746") }
                        .to(throwError(NetworkError.decodingFailed))
                    expect(validator.validateResponseURLResponseVoidCallsCount).to(equal(1))
                    expect(validator.validateResponseURLResponseVoidCalled).to(equal(true))
                    expect(requestBuilder.createRequestWithCityKeyStringURLRequestCallsCount).to(equal(1))
                    expect(requestBuilder.createRequestWithCityKeyStringURLRequestCalled).to(equal(true))
                }
            }
            
        }
    }

}
