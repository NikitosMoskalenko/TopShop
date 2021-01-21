//
//  ProductCellExtension.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/19/21.
//

import UIKit

extension ProductCell {
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        return imageView
    }
    
    func makeLabel(size: CGFloat) -> UILabel {
        let customLabel = UILabel()
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.textColor = .black
        customLabel.font = UIFont.systemFont(ofSize: size)
        contentView.addSubview(customLabel)
        return customLabel
    }
    
    func makeTitleLabel() -> UILabel {
        let titleLabel = makeLabel(size: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 0
        titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        return titleLabel
    }
    
    func makePriceLabel() -> UILabel {
        let priceLabel = makeLabel(size: 18)
        priceLabel.numberOfLines = 0
        priceLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 5).isActive = true
        priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        return priceLabel
    }
    
}

