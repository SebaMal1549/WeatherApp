// Generated using Sourcery 2.2.6 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif





















@testable import WeatherApp




class CitiesNetworkingServiceTypeMock: CitiesNetworkingServiceType {




    //MARK: - fetchCities

    var fetchCitiesSearchTextStringCityThrowableError: (any Error)?
    var fetchCitiesSearchTextStringCityCallsCount = 0
    var fetchCitiesSearchTextStringCityCalled: Bool {
        return fetchCitiesSearchTextStringCityCallsCount > 0
    }
    var fetchCitiesSearchTextStringCityReceivedSearchText: (String)?
    var fetchCitiesSearchTextStringCityReceivedInvocations: [(String)?] = []
    var fetchCitiesSearchTextStringCityReturnValue: [City]!
    var fetchCitiesSearchTextStringCityClosure: ((String?) async throws -> [City])?

    func fetchCities(searchText: String?) async throws -> [City] {
        fetchCitiesSearchTextStringCityCallsCount += 1
        fetchCitiesSearchTextStringCityReceivedSearchText = searchText
        fetchCitiesSearchTextStringCityReceivedInvocations.append(searchText)
        if let error = fetchCitiesSearchTextStringCityThrowableError {
            throw error
        }
        if let fetchCitiesSearchTextStringCityClosure = fetchCitiesSearchTextStringCityClosure {
            return try await fetchCitiesSearchTextStringCityClosure(searchText)
        } else {
            return fetchCitiesSearchTextStringCityReturnValue
        }
    }


}
class CitiesURLRequestBuilderTypeMock: CitiesURLRequestBuilderType {




    //MARK: - createRequest

    var createRequestWithSerachTextStringURLRequestThrowableError: (any Error)?
    var createRequestWithSerachTextStringURLRequestCallsCount = 0
    var createRequestWithSerachTextStringURLRequestCalled: Bool {
        return createRequestWithSerachTextStringURLRequestCallsCount > 0
    }
    var createRequestWithSerachTextStringURLRequestReceivedSerachText: (String)?
    var createRequestWithSerachTextStringURLRequestReceivedInvocations: [(String)] = []
    var createRequestWithSerachTextStringURLRequestReturnValue: URLRequest!
    var createRequestWithSerachTextStringURLRequestClosure: ((String) throws -> URLRequest)?

    func createRequest(with serachText: String) throws -> URLRequest {
        createRequestWithSerachTextStringURLRequestCallsCount += 1
        createRequestWithSerachTextStringURLRequestReceivedSerachText = serachText
        createRequestWithSerachTextStringURLRequestReceivedInvocations.append(serachText)
        if let error = createRequestWithSerachTextStringURLRequestThrowableError {
            throw error
        }
        if let createRequestWithSerachTextStringURLRequestClosure = createRequestWithSerachTextStringURLRequestClosure {
            return try createRequestWithSerachTextStringURLRequestClosure(serachText)
        } else {
            return createRequestWithSerachTextStringURLRequestReturnValue
        }
    }


}
class ResponseValidatorTypeMock: ResponseValidatorType {




    //MARK: - validate

    var validateResponseURLResponseVoidThrowableError: (any Error)?
    var validateResponseURLResponseVoidCallsCount = 0
    var validateResponseURLResponseVoidCalled: Bool {
        return validateResponseURLResponseVoidCallsCount > 0
    }
    var validateResponseURLResponseVoidReceivedResponse: (URLResponse)?
    var validateResponseURLResponseVoidReceivedInvocations: [(URLResponse)?] = []
    var validateResponseURLResponseVoidClosure: ((URLResponse?) throws -> Void)?

    func validate(_ response: URLResponse?) throws {
        validateResponseURLResponseVoidCallsCount += 1
        validateResponseURLResponseVoidReceivedResponse = response
        validateResponseURLResponseVoidReceivedInvocations.append(response)
        if let error = validateResponseURLResponseVoidThrowableError {
            throw error
        }
        try validateResponseURLResponseVoidClosure?(response)
    }


}
class WeatherDataNetworkingServiceTypeMock: WeatherDataNetworkingServiceType {




    //MARK: - fetchWeatherData

    var fetchWeatherDataCityKeyStringWeatherDataThrowableError: (any Error)?
    var fetchWeatherDataCityKeyStringWeatherDataCallsCount = 0
    var fetchWeatherDataCityKeyStringWeatherDataCalled: Bool {
        return fetchWeatherDataCityKeyStringWeatherDataCallsCount > 0
    }
    var fetchWeatherDataCityKeyStringWeatherDataReceivedCityKey: (String)?
    var fetchWeatherDataCityKeyStringWeatherDataReceivedInvocations: [(String)] = []
    var fetchWeatherDataCityKeyStringWeatherDataReturnValue: WeatherData!
    var fetchWeatherDataCityKeyStringWeatherDataClosure: ((String) async throws -> WeatherData)?

    func fetchWeatherData(cityKey: String) async throws -> WeatherData {
        fetchWeatherDataCityKeyStringWeatherDataCallsCount += 1
        fetchWeatherDataCityKeyStringWeatherDataReceivedCityKey = cityKey
        fetchWeatherDataCityKeyStringWeatherDataReceivedInvocations.append(cityKey)
        if let error = fetchWeatherDataCityKeyStringWeatherDataThrowableError {
            throw error
        }
        if let fetchWeatherDataCityKeyStringWeatherDataClosure = fetchWeatherDataCityKeyStringWeatherDataClosure {
            return try await fetchWeatherDataCityKeyStringWeatherDataClosure(cityKey)
        } else {
            return fetchWeatherDataCityKeyStringWeatherDataReturnValue
        }
    }


}
class WeatherDataURLRequestBuilderTypeMock: WeatherDataURLRequestBuilderType {


    var urlProvider: ((_ cityKey: String) -> URL) {
        get { return underlyingUrlProvider }
        set(value) { underlyingUrlProvider = value }
    }
    var underlyingUrlProvider: (((_ cityKey: String) -> URL))!
    var urlComponentsProvider: ((URL) -> URLComponents?) {
        get { return underlyingUrlComponentsProvider }
        set(value) { underlyingUrlComponentsProvider = value }
    }
    var underlyingUrlComponentsProvider: (((URL) -> URLComponents?))!


    //MARK: - createRequest

    var createRequestWithCityKeyStringURLRequestThrowableError: (any Error)?
    var createRequestWithCityKeyStringURLRequestCallsCount = 0
    var createRequestWithCityKeyStringURLRequestCalled: Bool {
        return createRequestWithCityKeyStringURLRequestCallsCount > 0
    }
    var createRequestWithCityKeyStringURLRequestReceivedCityKey: (String)?
    var createRequestWithCityKeyStringURLRequestReceivedInvocations: [(String)] = []
    var createRequestWithCityKeyStringURLRequestReturnValue: URLRequest!
    var createRequestWithCityKeyStringURLRequestClosure: ((String) throws -> URLRequest)?

    func createRequest(with cityKey: String) throws -> URLRequest {
        createRequestWithCityKeyStringURLRequestCallsCount += 1
        createRequestWithCityKeyStringURLRequestReceivedCityKey = cityKey
        createRequestWithCityKeyStringURLRequestReceivedInvocations.append(cityKey)
        if let error = createRequestWithCityKeyStringURLRequestThrowableError {
            throw error
        }
        if let createRequestWithCityKeyStringURLRequestClosure = createRequestWithCityKeyStringURLRequestClosure {
            return try createRequestWithCityKeyStringURLRequestClosure(cityKey)
        } else {
            return createRequestWithCityKeyStringURLRequestReturnValue
        }
    }


}
