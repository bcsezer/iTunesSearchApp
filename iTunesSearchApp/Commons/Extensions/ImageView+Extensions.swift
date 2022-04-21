//
//  ImageView+Extensions.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(imgUrl: String) {
        self.kf.setImage(with: URL(string: imgUrl))
    }
}
