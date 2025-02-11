//
//  CityWeatherDetailsCoordinator.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Combine
import Foundation
import UIKit

/// Coordinator for CityWeatherDetails feature.
final class CityWeatherDetailsCoordinator: Coordinator {
    
    // MARK: - Publisher
    
    private var navigationEventsPublisher: AnyPublisher<CityWeatherDetailsViewModel.NavigationEvent, Never>?
    
    // MARK: - Properties
    
    var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    private let city: City
    private var cancellables = [AnyCancellable]()
    
    // MARK: - Lifecycle
    
    init(
        navigationController: UINavigationController,
        city: City,
        parentCoordinator: Coordinator? = nil
    ) {
        self.parentCoordinator = parentCoordinator
        self.city = city
        self.navigationController = navigationController
    }
    
    // MARK: - API
    
    func start() {
        let networkingService = WeatherDataNetworkingService()
        let viewModel = CityWeatherDetailsViewModel(city: city, networkingService: networkingService)
        let viewController = CityWeatherDetailsViewController(viewModel: viewModel)
        parentCoordinator?.children.append(self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController.popViewController(animated: true)
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
                case let .showAlert(title, message):
                    showAlert(title: title, message: message)
                case .finish:
                    finish()
                }
            }
            .store(in: &cancellables)
    }
    
}
