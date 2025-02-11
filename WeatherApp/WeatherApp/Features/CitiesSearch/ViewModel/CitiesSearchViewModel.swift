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
    
    lazy var citiesListFetchedPublisher = _citiesListFetchedPublisher.eraseToAnyPublisher()
    private let _citiesListFetchedPublisher = PassthroughSubject<[City], Never>()
    
    lazy var navigationEventsPublisher: AnyPublisher<NavigationEvent, Never> = _navigationEventsSubject.eraseToAnyPublisher()
    private let _navigationEventsSubject = PassthroughSubject<NavigationEvent, Never>()
    
    let eventsSubject = PassthroughSubject<CitiesSearchView.Event, Never>()
    
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
    
    private let networkingService: CitiesNetworkingServiceType
    private var cancellables = [AnyCancellable]()
    
    // MARK: - Lifecycle
    
    init(networkingService: CitiesNetworkingServiceType) {
        self.networkingService = networkingService
        bindEvents()
    }
    
    deinit {
        _navigationEventsSubject.send(.finish)
    }
    
    // MARK: - Methods
    
    private func handleViewEvent(_ event: CitiesSearchView.Event) {
        switch event {
        case let .userTappedCityCell(city):
            goToWeatherDetails(for: city)
        default:
            break
        }
    }
    
    private func bindEvents() {
        eventsSubject
            .sink { [weak self] event in
                guard let self else { return }
                handleViewEvent(event)
            }
            .store(in: &cancellables)
        
        searchTextDidChangePublisher?
            .dropFirst()
            .removeDuplicates()
            .debounce(for: .seconds(Constants.searchFieldDebounceTime), scheduler: RunLoop.main)
            .sink { [weak self] searchText in
                guard let self, !searchText.isEmpty else { return }
                sendRequestToGetCities(with: searchText)
            }
            .store(in: &cancellables)
    }
    
    private func goToWeatherDetails(for city: City) {
        _navigationEventsSubject.send(.goToWeatherDetails(city))
    }
    
    private func sendRequestToGetCities(with searchText: String?) {
        Task {
            do {
                let cities = try await self.networkingService.fetchCities(searchText: searchText).sorted()
                _citiesListFetchedPublisher.send(cities)
            } catch {
                os_log("NetworkingError: \(error)")
                _navigationEventsSubject.send(.showAlert(title: "Nie udało się pobrać listy miast.",
                                                         message: "Spróbuj ponownie później."))
            }
        }
    }
    
}
