//
//  EmptyCell.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import UIKit

class EmptyCell: UICollectionViewCell {
    static let identifier = "EmptyCell"
    
    @IBOutlet private weak var norResultImage: UIImageView!
    
    func willDisplay() {
        norResultImage.image = UIImage(named: "no-result")
    }
}
