//
//  RequestManager.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import Foundation

// MARK: - RequesterProtocol

protocol RequestManagerProtocol {
    
}

// MARK: - Requester

final class RequestManager: RequestManagerProtocol {
    
    static let shared = RequestManager()
    
    public func getProductsList(onSuccess: @escaping (ListProductsModel?) -> Void) {
        let session = URLSession.shared
        guard let fullURL = URL(string: URLsString.baseURL + URLsString.productList) else { return }
        let requestURL = URLRequest(url: fullURL)
        
        let task = session.dataTask(with: requestURL, completionHandler: { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let json = try JSONDecoder().decode(ListProductsModel.self, from: data)
                    onSuccess(json)
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
            }
        })
        task.resume()
    }
    
    public func getDetailInfoProductWithID(_ id: String, onSuccess: @escaping (ProductsDetailModel?) -> Void) {
        let session = URLSession.shared
        
        guard let fullURL = URL(string: URLsString.baseURL + id + URLsString.detailProductInfoURL) else { return }
        
        let requestURL = URLRequest(url: fullURL)
        
        let task = session.dataTask(with: requestURL, completionHandler: { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let json = try JSONDecoder().decode(ProductsDetailModel.self, from: data)
                    onSuccess(json)
                } catch {
                    print("Error during JSON serialization 2: \(error.localizedDescription)")
                }
            }
        })
        task.resume()
    }
    
}
