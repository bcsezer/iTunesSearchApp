//
//  HomeInteractor.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import Foundation

protocol HomeBusinessLogic {
    func handle(request: HomeModels.GetSearchList.Request)
    func handle(request: HomeModels.TapImage.Request)
    func handle(request: HomeModels.ScrollToBottom.Request)
}

class HomeInteractor: HomeBusinessLogic {
    var presenter: HomePresentationLogic?
    
    private var results: [Result] = []
    private var keyword: String?
    private var limit: Int = 25
    private var isPaging: Bool = false
    
    func handle(request: HomeModels.GetSearchList.Request) {
        self.keyword = request.keyword
        getData()
    }
    
    func handle(request: HomeModels.TapImage.Request) {
        presenter?.present(
            response: HomeModels.TapImage.Response(
                selecteImageData: request.selecteImageData
            )
        )
    }
    
    func handle(request: HomeModels.ScrollToBottom.Request) {
        limit += 25
        getData()
    }
    
    private func getData() {
        NetworkManager.shared.getList(keyword: self.keyword, limit: self.limit) { [weak self] data in
            
            self?.results = data.results ?? []
            
            self?.presenter?.present(
                response: HomeModels.GetSearchList.Response(
                    imageList: self?.results ?? []
                )
            )
            
        } failure: { Error in
            self.presenter?.present(
                response: HomeModels.GetSearchList.Response(
                    imageList: []
                )
            )
        }
    }
}
