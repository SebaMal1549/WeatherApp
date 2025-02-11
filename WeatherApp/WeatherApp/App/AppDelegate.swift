//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties

    private let window: UIWindow?
    private let appCoordinator: AppCoordinator?

    // MARK: - Lifecycle

    override init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator.init(navigationController: UINavigationController())
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator?.start()
        window?.makeKeyAndVisible()
        window?.rootViewController = appCoordinator?.navigationController
        return true
    }

}
