//
//  CityWeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Combine
import UIKit

/// ViewController for CityWeatherDetails feature.
final class CityWeatherDetailsViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: CityWeatherDetailsViewModel
    private let customView = CityWeatherDetailsMainView()

    private var cancellables = [AnyCancellable]()

    // MARK: - Lifecycle

    init(viewModel: CityWeatherDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindEvents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
        title = "Informacje"
    }

    // MARK: - Methods

    private func bindEvents() {
        viewModel.weatherDataFetchedPublisher
            .sink { [weak self] weatherData, city in
                guard let self else { return }
                customView.configureView(with: weatherData, and: city)
            }
            .store(in: &cancellables)
    }

}
