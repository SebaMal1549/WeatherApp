//
//  CitiesSearchCoordinator.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Combine
import Foundation
import UIKit

/// Coordinator for CitiesSearch feature.
final class CitiesSearchCoordinator: Coordinator {
    
    // MARK: - Publisher
    
    private var navigationEventsPublisher: AnyPublisher<CitiesSearchViewModel.NavigationEvent, Never>?
    
    // MARK: - Properties
    
    var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    private var cancellables = [AnyCancellable]()
    
    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    // MARK: - API
    
    func start() {
        let networkigService = CitiesNetworkingService()
        let viewModel = CitiesSearchViewModel(networkingService: networkigService)
        let viewController = CitiesSearchViewController(viewModel: viewModel)
        navigationEventsPublisher = viewModel.navigationEventsPublisher
        parentCoordinator?.children.append(self)
        navigationController.setViewControllers([viewController], animated: true)
        bindEvents()
    }
    
    func goToWeatherDetails(for city: City) {
        let coordinator = CityWeatherDetailsCoordinator(navigationController: navigationController,
                                                        city: city,
                                                        parentCoordinator: self)
        coordinator.start()
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)  { _ in
                if let test = self.navigationController.topViewController as? CitiesSearchViewController {
                    test.clearSearchText()
                }
            }
            
            alert.addAction(action)
            navigationController.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Methods
    
    private func bindEvents() {
        navigationEventsPublisher?
            .sink { [weak self] event in
                guard let self else { return }
                switch event {
                case let .goToWeatherDetails(city):
                    goToWeatherDetails(for: city)
                case .finish:
                    finish()
                case let .showAlert(title, message):
                    showAlert(title: title, message: message)
                }
            }
            .store(in: &cancellables)
    }
    
}
