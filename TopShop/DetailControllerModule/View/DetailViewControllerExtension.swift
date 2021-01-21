//
//  DetailViewControllerExtension.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/21/21.
//

import UIKit


extension DetailViewController {
    
    func createImageView() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(iv)
        iv.heightAnchor.constraint(equalToConstant: 100).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        iv.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -(iv.frame.height/2)).isActive = true
        return iv
    }
    
    func makeLabel(size: CGFloat) -> UILabel {
        let customLabel = UILabel()
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.textColor = .black
        customLabel.textAlignment = .center
        customLabel.font = UIFont.systemFont(ofSize: size)
        self.view.addSubview(customLabel)
        return customLabel
    }
    
    func makeTitleLabel() -> UILabel {
        let tl = makeLabel(size: 20)
        tl.numberOfLines = 0
        tl.topAnchor.constraint(equalTo: self.productImageView.bottomAnchor, constant: 5).isActive = true
        tl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        tl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        return tl
    }
    
    func makePriceLabel() -> UILabel {
        let pl = makeLabel(size: 18)
        pl.numberOfLines = 0
        pl.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5).isActive = true
        pl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        pl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        return pl
    }
    
    func makeDescriptionLabel() -> UILabel {
        let pl = makeLabel(size: 14)
        pl.numberOfLines = 0
        pl.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 5).isActive = true
        pl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        pl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        return pl
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
    
}
