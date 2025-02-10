//
//  CitiesSearchCoordinator.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Foundation
import UIKit

/// Coordinator for CitiesSearch feature.
final class CitiesSearchCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController
    
    private weak var viewController: CitiesSearchViewController?
    
    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    // MARK: - API
    
    func start() {
        let networkigService = CitiesNetworkingService(requestBuilder: CitiesURLRequestBuilder())
        let viewModel = CitiesSearchViewModel(networkingService: networkigService, coordinator: self)
        let viewController = CitiesSearchViewController(viewModel: viewModel)
        self.viewController = viewController
        parentCoordinator?.children.append(self)
        navigationController.setViewControllers([viewController], animated: true)
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
                self.viewController?.clearSearchText()
            }
            
            alert.addAction(action)
            navigationController.present(alert, animated: true, completion: nil)
        }
    }
    
}
