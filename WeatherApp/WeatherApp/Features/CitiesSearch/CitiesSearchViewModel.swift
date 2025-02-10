//
//  CitiesSearchViewModel.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Combine
import Foundation
import os

/// ViewModel for the feature responsible for the city search view.
final class CitiesSearchViewModel {
    
    // MARK: - Publishers
    
    /// Publisher indicating that the list of cities has been fetched.
    lazy var citiesListFetchedPublisher = _citiesListFetchedPublisher.eraseToAnyPublisher()
    private let _citiesListFetchedPublisher = PassthroughSubject<[City], Never>()
    
    let eventsSubject = PassthroughSubject<CitiesSearchViewEvent, Never>()
    
    private lazy var searchTextDidChangePublisher: AnyPublisher<String, Never>? = eventsSubject
        .compactMap { event in
            if case let .userEditedSearchText(searchText) = event {
                return searchText
            } else {
                return nil
            }
        }
        .eraseToAnyPublisher()
    
    // MARK: - Properties
        
    private weak var coordinator: CitiesSearchCoordinator?
    
    private let networkingService: AnyCitiesNetworkingService
    private var cancellables = [AnyCancellable]()
    
    // MARK: - Lifecycle
    
    init(networkingService: AnyCitiesNetworkingService, coordinator: CitiesSearchCoordinator?) {
        self.networkingService = networkingService
        self.coordinator = coordinator
        bind()
    }
    
    deinit {
        coordinator?.finish()
    }
    
    // MARK: - API
    
    func handleViewEvent(_ event: CitiesSearchViewEvent) {
        switch event {
        case let .userTappedCityCell(city):
            goToWeatherDetails(for: city)
        default:
            break
        }
    }
    
    // MARK: - Methods
    
    private func bind() {
        eventsSubject
            .sink { [weak self] event in
                guard let self else { return }
                handleViewEvent(event)
            }
            .store(in: &cancellables)
        
        searchTextDidChangePublisher?
            .dropFirst()
            .removeDuplicates()
            .debounce(for: .seconds(0.2), scheduler: RunLoop.main)
            .sink { [weak self] searchText in
                guard let self, !searchText.isEmpty else { return }
                sendRequestToGetCities(with: searchText)
            }
            .store(in: &cancellables)
    }
    
    private func goToWeatherDetails(for city: City) {
        coordinator?.goToWeatherDetails(for: city)
    }
    
    private func sendRequestToGetCities(with searchText: String?) {
        Task {
            do {
                let cities = try await self.networkingService.fetchCities(searchText: searchText)//.sorted()
                _citiesListFetchedPublisher.send(cities)
            } catch {
                os_log("NetworkingError: \(error)")
                coordinator?.showAlert(title: "Nie udało się pobrać listy miast.",
                                       message: "Spróbuj ponownie później.")
            }
        }
    }
    
}
