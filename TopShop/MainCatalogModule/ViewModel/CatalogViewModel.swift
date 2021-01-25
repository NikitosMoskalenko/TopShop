//
//  CatalogViewModel.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import Foundation

// MARK: - CatalogViewModelProtocol

protocol CatalogViewModelProtocol {
    var productsList: ListProductsModel? { get set }
    func startingLoadingData(activityIndicatorCondition: @escaping (ActivityIndicatorActionStatus) -> ())
    func getCellsCount() -> Int
    func setDataToCell(_ cell: ProductCell, indexPath: IndexPath)
    func makeDetailInfoController(indexPath: IndexPath) -> DetailViewController
}

// MARK: - CatalogViewModel

final class CatalogViewModel: CatalogViewModelProtocol {
    
    
    var productsList: ListProductsModel?
    
    func startingLoadingData(activityIndicatorCondition: @escaping (ActivityIndicatorActionStatus) -> ()) {
        activityIndicatorCondition(.start)
        RequestManager.shared.getProductsList { [weak self] (productList) in
            guard let self = self else { return }
            guard productList != nil else {
                activityIndicatorCondition(.stop)
                // TODO: show error alert
                return
            }
            self.productsList = productList!
            activityIndicatorCondition(.stop)
        }
    }
    
    func getCellsCount() -> Int {
        guard let cellsCount = productsList?.products.count else { return 0}
        return cellsCount
    }
    
    func setDataToCell(_ cell: ProductCell, indexPath: IndexPath) {
        guard let listProducts = productsList else { return }
        let productCellData = ProductCellModel(image: listProducts.products[indexPath.row].image,
                                               title: listProducts.products[indexPath.row].name,
                                               price: "\(listProducts.products[indexPath.row].price)")
        cell.data = productCellData
    }
    
    func makeDetailInfoController(indexPath: IndexPath) -> DetailViewController {
        let detailVC = Builder.makeDetailView()
        guard let productID = productsList?.products[indexPath.row].productID else { return DetailViewController() }
        detailVC.detailViewModel?.productID = productID
        
        return detailVC
    }
}
