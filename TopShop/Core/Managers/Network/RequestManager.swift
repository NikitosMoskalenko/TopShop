//
//  Requester.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import Foundation

// MARK: - RequesterProtocol

protocol RequesterProtocol {
    func createRequestWithURL(_ urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

// MARK: - Requester

struct Requester: RequesterProtocol {
    
    private func createDataTask(url request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        let session = URLSession.shared.dataTask(with: request) { (data, _, error) in
            completion(data, error)
        }
        return session
    }
    
    func createRequestWithURL(_ urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let dataTesk = createDataTask(url: request, completion: completion)
        dataTesk.resume()
    }
    
}
