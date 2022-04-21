//
//  HomeInitialView.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import UIKit


class HomeInitialView: UIView {
    @IBOutlet private var contentView: UIView!
    
    // MARK: Initiliazers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Private Functions
    private func setup() {
        Bundle.main.loadNibNamed("HomeInitialView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
}
