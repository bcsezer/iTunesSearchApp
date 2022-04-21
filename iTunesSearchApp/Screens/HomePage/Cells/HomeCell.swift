//
//  HomeCell.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import UIKit

class HomeCell: UICollectionViewCell {
    static let identifier = "HomeCell"
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    private var data: HomeModels.ImageModel?
    
    private struct Constants {
        static let cornerRadious: CGFloat = 4.0
        static let borderWidth: CGFloat = 2.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        apperance()
    }
    
    func willDisplay(data: HomeModels.ImageModel) {
        if let image = data.image {
            self.image.setImage(imgUrl: image)
        } else {
            self.image.image = UIImage(named: "empty-image")
        }
        
        self.data = data
    }
    
    private func apperance() {
        containerView.style(
            style: ViewStyle(
                backgroundColor: nil,
                tintColor: nil,
                layerStyle: ViewStyle.LayerStyle(
                    masksToBounds: true,
                    cornerRadius: Constants.cornerRadious,
                    borderStyle: ViewStyle.LayerStyle.BorderStyle(
                        color: Colors.lightGreen,
                        width: Constants.borderWidth
                    )
                )
            )
        )
    }
    
}
