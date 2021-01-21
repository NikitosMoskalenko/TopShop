//
//  AppDelegate.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/18/21.
//

import UIKit

// MARK: - AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Public properties

    var window: UIWindow?
    var coordinator: CoordinatorProtocol?
    
    // MARK: Public methods

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        
        coordinator = Coordinator(navigationController: navigationController, window: window)
        coordinator?.start()
        
        return true
    }

}

