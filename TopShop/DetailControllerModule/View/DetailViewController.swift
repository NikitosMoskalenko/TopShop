//
//  DetailView.swift
//  TopShop
//
//  Created by Nikita Moskalenko on 1/20/21.
//

import UIKit

// MARK: - DetailViewController

final class DetailViewController: UIViewController {
    
    // MARK: Public properties
    
    var detailViewModel: DetailViewModelProtocol?
    
    lazy var productImageView = createImageView()
    lazy var titleLabel = makeTitleLabel()
    lazy var priceLabel = makePriceLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    lazy var activityIndicator = makeActivityIndicator()
    
    // MARK: Private properties
    
    private var cachedImage = NSCache<NSString, UIImage>()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateData()
    }
    
    private func updateData() {
        activitySetup(status: .start)
        guard detailViewModel?.productID != nil, detailViewModel?.productID?.count != 0 else
        {
            activitySetup(status: .stop)
            return
        }
        detailViewModel?.getData(id: (detailViewModel?.productID)!, onSuccess: { [weak self] (viewData) in
            guard let self = self else { return }
            guard let price = viewData?.price else { return }
            self.productImageView.image = self.loadIcons(urlString: viewData?.image ?? " ")
            self.titleLabel.text = viewData?.name
            self.priceLabel.text = "\(price)"
            self.descriptionLabel.text = viewData?.description
            self.navigationItem.title = viewData?.name
            self.activitySetup(status: .stop)
        })
    }
    
    private func loadIcons(urlString: String) -> UIImage {
        guard let url = URL(string: urlString),
              let imageData = try? Data(contentsOf: url) else
        {
            return UIImage()
            
        }
        var im = UIImage()
        if let cachedImage = cachedImage.object(forKey: url.absoluteString as NSString) {
            im = cachedImage
            return im
        } else {
            im = UIImage(data: imageData)!
            self.cachedImage.setObject(im, forKey: url.absoluteString as NSString)
            return im
        }
    }
    
    private func activitySetup(status: ActivityIndicatorActionStatus) {
        switch status {
        case .start:
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        case .stop:
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
}
