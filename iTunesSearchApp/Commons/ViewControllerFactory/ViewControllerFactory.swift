//
//  ViewControllerFactory.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    func makeHomeViewController() -> UIViewController
    func makeDetailViewController(data: HomeModels.ImageModel) -> UIViewController
}

struct ViewControllerFactory: ViewControllerFactoryProtocol {
    static let sharedInstance = ViewControllerFactory()
    
    func makeHomeViewController() -> UIViewController {
        let viewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        router.viewController = viewController
        viewController.router = router
        return viewController
    }
    
    func makeDetailViewController(data: HomeModels.ImageModel) -> UIViewController {
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        interactor.presenter = presenter
        interactor.data = data
        presenter.viewController = viewController
        viewController.interactor = interactor
        return viewController
    }
}

