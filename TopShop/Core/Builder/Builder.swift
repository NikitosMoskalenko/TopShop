//
//  Builder.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import Foundation

 // MARK: - BuilderProtocol

protocol BuilderProtocol: class {
    static func makeCatalogView() -> CatalogCollectionView
    static func makeDetailView() -> DetailViewController
}

// MARK: - Builder

final class Builder: BuilderProtocol {
    
    static func makeCatalogView() -> CatalogCollectionView {
        let viewController = CatalogCollectionView()
        let catalogVM = CatalogViewModel()
        viewController.catalogVM = catalogVM
        
        return viewController
    }
    
    static func makeDetailView() -> DetailViewController {
        let detailVM = DetailViewModel()
        let viewcontroller = DetailViewController()
        viewcontroller.detailViewModel = detailVM
        
        return viewcontroller
    }
    
}
