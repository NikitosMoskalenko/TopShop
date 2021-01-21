//
//  Coordinator.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import UIKit

// MARK: - CoordinatorProtocol

protocol CoordinatorProtocol {
    func start()
}

// MARK: - Coordinator

final class Coordinator: CoordinatorProtocol {
    
    // MARK: Public properties
    
    var navigationController: UINavigationController
    var window: UIWindow?
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
        
        setWindow()
    }
    
    func start() {
        goToCatalogCollectionView()
    }
    
    // MARK: - Private methods
    
    private func goToCatalogCollectionView() {
        let catalog = Builder.makeCatalogView()
        navigationController.pushViewController(catalog, animated: true)
    }
    
    
    private func setWindow() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light
        window?.backgroundColor = .white
    }
    
}
