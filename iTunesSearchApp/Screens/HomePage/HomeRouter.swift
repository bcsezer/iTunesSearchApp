//
//  HomeRouter.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//


import UIKit

protocol HomeRoutingLogic {
    func routeToDetail(data: HomeModels.ImageModel)
}

class HomeRouter: NSObject, HomeRoutingLogic {
    weak var viewController: HomeViewController?

    // MARK: Routing Logic
    
    func routeToDetail(data: HomeModels.ImageModel) {
        let productDetailVC = ViewControllerFactory.sharedInstance.makeDetailViewController(data: data)
        viewController?.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
