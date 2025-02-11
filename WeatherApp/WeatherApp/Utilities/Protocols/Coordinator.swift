//
//  Coordinator.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 05/02/2025.
//

import Foundation
import UIKit

/// Protocol describing the coordinator, responsible for navigating the application.
protocol Coordinator: AnyObject {

    // MARK: - Properties

    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    // MARK: - API

    /// The method responsible for launching the coordinator. Used once, at the beginning of the coordinator's work.
    func start()

    /// The method responsible for removing the specified coordinator from the list of children.
    /// The method has a default implementation.
    func removeChild(_ coordinator: Coordinator?)

    /// Method responsible for termination of the coordinator. Used once, at the end of the coordinator's work
    /// The method has a default implementation.
    func finish()

}
