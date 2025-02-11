//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Foundation
import UIKit

/// Main application coordinator.
final class AppCoordinator: Coordinator {

    // MARK: - Properties

    var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: - Lifecycle

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - API

    func start() {
        goToCitiesSearch()
    }

    func goToCitiesSearch() {
        let citiesSearchCoordinator = CitiesSearchCoordinator(navigationController: navigationController,
                                                              parentCoordinator: self)
        citiesSearchCoordinator.start()
    }

}
