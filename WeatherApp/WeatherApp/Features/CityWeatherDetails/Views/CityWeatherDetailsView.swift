//
//  CityWeatherDetailsView.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import UIKit

/// View responsible for presenting the weather in a particular city.
final class CityWeatherDetailsView: UIView {

    // MARK: - Properties

    private let temperatureLabelVerticalMargin = CGFloat(40)
    private let gridSpacing = CGFloat(15)
    private let gridRowHeight = CGFloat(60)

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()

    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 26)!
        return label
    }()

    private let weatherTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .callout).pointSize, weight: .light)
        label.textColor = .secondaryLabel
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 40)!
        return label
    }()

    private lazy var gridView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = gridSpacing
        return stackView
    }()

    private lazy var firstRowView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = gridSpacing
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var secondRowView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = gridSpacing
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let windTile = WeatherConditionTileView()
    private let realFeelTemperatureTile = WeatherConditionTileView()
    private let humidityTile = WeatherConditionTileView()
    private let visibilityTile = WeatherConditionTileView()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API

    /// The method responsible for configuring the view using the selected city and weather data.
    func configureView(with weatherData: WeatherData, and city: City) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            cityNameLabel.text = city.name
            weatherTextLabel.text = weatherData.weatherText
            temperatureLabel.text = weatherData.formattedTemperature
            windTile.reloadView(title: "Wiatr", value: weatherData.formattedWindSpeed)
            realFeelTemperatureTile.reloadView(title: "Temperatura odczuwalna",
                                               value: weatherData.formattedRealFeelTemperature)
            humidityTile.reloadView(title: "Wilgotność", value: weatherData.formattedRelativeHumidity)
            visibilityTile.reloadView(title: "Widoczność", value: weatherData.formattedVisibility)
        }
    }

    // MARK: - Methods

    private func setupView() {
        backgroundColor = .tertiarySystemBackground

        addSubview(mainStackView)
        mainStackView.addArrangedSubview(cityNameLabel)
        mainStackView.addArrangedSubview(weatherTextLabel)
        mainStackView.addArrangedSubview(temperatureLabel)
        mainStackView.setCustomSpacing(temperatureLabelVerticalMargin, after: weatherTextLabel)

        addSubview(gridView)

        gridView.addArrangedSubview(firstRowView)
        firstRowView.addArrangedSubview(humidityTile)
        firstRowView.addArrangedSubview(visibilityTile)

        gridView.addArrangedSubview(secondRowView)
        secondRowView.addArrangedSubview(realFeelTemperatureTile)
        secondRowView.addArrangedSubview(windTile)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            mainStackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),

            gridView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor,
                                          constant: temperatureLabelVerticalMargin),
            gridView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: -40),
            gridView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            firstRowView.heightAnchor.constraint(equalToConstant: gridRowHeight),
            secondRowView.heightAnchor.constraint(equalToConstant: gridRowHeight)
        ])
    }

}
