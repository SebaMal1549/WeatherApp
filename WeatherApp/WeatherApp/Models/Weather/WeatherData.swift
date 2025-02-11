//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 06/02/2025.
//

import Foundation

/// It contains all the information about the weather at the selected location that is needed to build the view.
struct WeatherData: Decodable, Equatable {

    // MARK: - Properties

    /// Phrase description of the current weather condition.
    let weatherText: String

    let temperature: Temperature?
    private let relativeHumidity: Int?
    private let realFeelTemperature: RealFeelTemperature
    private let wind: Wind
    private let visibility: Visibility

    // MARK: - Lifecycle

    init(
        weatherText: String,
        relativeHumidity: Int?,
        temperature: Temperature?,
        realFeelTemperature: RealFeelTemperature,
        wind: Wind,
        visibility: Visibility
    ) {
        self.weatherText = weatherText
        self.relativeHumidity = relativeHumidity
        self.temperature = temperature
        self.realFeelTemperature = realFeelTemperature
        self.wind = wind
        self.visibility = visibility
    }

    // MARK: - API

    /// Current temperature value as double.
    var temperatureValue: Double? { temperature?.metric.value }

    /// Temperature formatted to a caption, including value and unit.
    var formattedTemperature: String {
        getFormattedTemperature(temperature?.metric.value)
    }

    /// Real feel temperature formatted to a caption, including value and unit.
    var formattedRealFeelTemperature: String {
        getFormattedTemperature(realFeelTemperature.metric.value)
    }

    /// Wind speed formatted to a caption, including value and unit.
    var formattedWindSpeed: String { formatMetricToString(wind.speed.metric) }

    /// Visibility formatted to a caption, including value and unit.
    var formattedVisibility: String { formatMetricToString(visibility.metric) }

    /// Relative humidity formatted to a caption, including value and unit.
    var formattedRelativeHumidity: String {
        guard let relativeHumidity else { return "-" }
        return "\(relativeHumidity)%"
    }

    // MARK: - Methods

    //
    private func getFormattedTemperature(_ value: Double?) -> String {
        guard let temperature = value?.rounded() else { return "-" }
        return "\(Int(temperature))°"
    }

    private func formatMetricToString(_ metric: Metric?) -> String {
        guard let metric, let value = metric.value else {
            return "Brak informacji"
        }
        return "\(Int(value)) \(metric.unit)"
    }

    // MARK: - CodingKeys

    enum CodingKeys: String, CodingKey {

        case weatherText = "WeatherText"
        case temperature = "Temperature"
        case realFeelTemperature = "RealFeelTemperature"
        case relativeHumidity = "RelativeHumidity"
        case wind = "Wind"
        case visibility = "Visibility"

    }

}
