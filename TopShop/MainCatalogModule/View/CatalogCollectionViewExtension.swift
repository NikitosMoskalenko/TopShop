//
//  CatalogCollectionViewExtension.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import UIKit

extension CatalogCollectionView {
    
    func makeCatalogCollectionView() -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.scrollDirection = .vertical
        cv.delegate = self
        cv.dataSource = self
        cv.frame = self.view.bounds
        cv.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.SelfIdentifire())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        view.addSubview(cv)
        cv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        cv.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        cv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        cv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        return cv
    }
    
    func makeActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        return activityIndicator
    }
    
    func navigatioSetup() {
        navigationItem.title = "Products list"
        navigationItem.largeTitleDisplayMode = .always
    }
    
}
