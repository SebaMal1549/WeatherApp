//
//  CityWeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Combine
import Foundation
import os

/// ViewModel for the feature responsible for the city weather details view.
final class CityWeatherDetailsViewModel {
    
    // MARK: - Publisher
    
    /// Publisher indicating that data on weather details in a particular city has been downloaded.
    lazy var weatherDataFetchedPublisher = _weatherDataFetchedPublisher.eraseToAnyPublisher()
    private let _weatherDataFetchedPublisher = PassthroughSubject<(WeatherData, City), Never>()
    
    // MARK: - Properties
    
    private let city: City
    private let networkingService: AnyWeatherDataNetworkingService
    
    private weak var coordinator: CityWeatherDetailsCoordinator?
    
    // MARK: - Lifecycle
    
    init(
        city: City,
        networkingService: AnyWeatherDataNetworkingService,
        coordinator: CityWeatherDetailsCoordinator?
    ) {
        self.city = city
        self.networkingService = networkingService
        self.coordinator = coordinator
        fetchWeatherData()
    }
    
    deinit {
        coordinator?.finish()
    }
    
    // MARK: - API
    
    private func fetchWeatherData() {
        Task { [weak self] in
            guard let self else { return }
            do {
                let weatherData = try await networkingService.fetchWeatherData(cityKey: city.key)
                _weatherDataFetchedPublisher.send((weatherData, city))
            } catch {
                os_log("NetworkingError: \(error.localizedDescription)")
                coordinator?.showAlert(title: "Nie udało się pobrać szczegółów pogody.",
                                       message: "Spróbuj ponownie później.")
            }
        }
    }
    
}
