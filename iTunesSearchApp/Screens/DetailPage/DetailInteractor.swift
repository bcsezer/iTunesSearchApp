//
//  DetailInteractor.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 20.04.2022.
//

import Foundation

protocol DetailPageBusinessLogic {
    func handle(request: DetailModels.GetDetail.Request)
}

class DetailInteractor: DetailPageBusinessLogic {
    var presenter: DetailPagePresentationLogic?
    
    var data: HomeModels.ImageModel?
    
    func handle(request: DetailModels.GetDetail.Request) {
        guard let data = self.data else {
            return
        }
        presenter?.present(response: DetailModels.GetDetail.Response(data: data))
    }
}
