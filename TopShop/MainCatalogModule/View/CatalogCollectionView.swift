//
//  CatalogCollectionView.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import UIKit

// MARK: - ActivityIndicatorActionStatus

enum ActivityIndicatorActionStatus {
    case start
    case stop
}

// MARK: - CatalogCollectionView

final class CatalogCollectionView: UIViewController {
    
    // MARK: - Properties

    var catalogVM: CatalogViewModelProtocol?
    
    lazy var collectionView = makeCatalogCollectionView()
    lazy var activityIndicator = makeActivityIndicator()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catalogVM?.startingLoadingData(activityIndicatorCondition: activitySetup(status:))
        navigatioSetup()
    }
    
    // MARK: - Private Methods
    
    private func activitySetup(status: ActivityIndicatorActionStatus) {
        switch status {
        case .start:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .stop:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            collectionView.reloadData()
        }
    }
    
    private func segueToDetail(indexPath: IndexPath) {
        guard let detailVC = catalogVM?.makeDetailInfoController(indexPath: indexPath) else { return }
        navigationController?.pushViewController(detailVC, animated: false)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CatalogCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return catalogVM?.getCellsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.SelfIdentifire(), for: indexPath) as? ProductCell else
        {
            return UICollectionViewCell()
        }
        catalogVM?.setDataToCell(cell, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        segueToDetail(indexPath: indexPath)
    }
    
}
