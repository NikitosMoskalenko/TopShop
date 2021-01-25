//
//  DetailViewModel.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/20/21.
//

import Foundation

protocol DetailViewModelProtocol {
    var productID: String? { get set }
    var detailInfoProduct: ProductsDetailModelProtocol? { get set }
    var productInfo: ProductsDetailModel? { get set }
    func getData(id: String, onSuccess: @escaping (ProductsDetailModel?) -> Void)
    func setData() -> DetailControllerModel
}

// MARK: - DetailViewModel

final class DetailViewModel: DetailViewModelProtocol {
    
    var productID: String?
    var productInfo: ProductsDetailModel?
    var detailInfoProduct: ProductsDetailModelProtocol?
    
    func getData(id: String, onSuccess: @escaping (ProductsDetailModel?) -> Void) {
        guard productID != nil, productID?.count != 0 else { return }
        RequestManager.shared.getDetailInfoProductWithID(id, onSuccess: onSuccess)
    }
    
    func setData() -> DetailControllerModel {
        let data = DetailControllerModel(imageNamed: productInfo?.image,
                                         title: productInfo?.name,
                                         price: "\(productInfo?.price)",
                                         description: productInfo?.description)
        return data
    }
    
}
