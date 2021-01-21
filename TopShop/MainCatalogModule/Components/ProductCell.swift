//
//  ProductCell.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import UIKit

// MARK: - ProductCell

class ProductCell: UICollectionViewCell {
    
    var data: ProductCellModel? {
        didSet {
            updateUI()
        }
    }
    
    var imageCache = NSCache<NSString, UIImage>()
    
    lazy var productImageView = makeImageView()
    lazy var productTitleLabel = makeTitleLabel()
    lazy var productPriceLabel = makePriceLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    static func SelfIdentifire() -> String {
        return String(describing: self)
    }
    
    private func loadingIcons() -> UIImage {
        var im = UIImage()
        
        guard let data = data,
              let url = URL(string: data.image),
              let imageData = try? Data(contentsOf: url)
        else {
            return UIImage()
        }
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            im = cachedImage
            return im
        } else {
            im = UIImage(data: imageData)!
            self.imageCache.setObject(im, forKey: url.absoluteString as NSString)
            return im
        }
    }
    
    private func updateUI() {
        guard let data = data else { return }
        
        productImageView.image = loadingIcons()
        productTitleLabel.text = data.title
        productPriceLabel.text = data.price
    }
    
}
