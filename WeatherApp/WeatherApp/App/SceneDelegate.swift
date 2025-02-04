//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by Sebastian Maludziński on 04/02/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Properties

    var window: UIWindow?
    
    // MARK: - API
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let mainViewController = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        window = UIWindow(windowScene: scene as! UIWindowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
