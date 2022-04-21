//
//  HomePresenter.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import Foundation

protocol HomePresentationLogic {
    func present(response: HomeModels.GetSearchList.Response)
    func present(response: HomeModels.TapImage.Response)
}

class HomePresenter: HomePresentationLogic {
    var viewController: HomeDisplayLogic?
    
    func present(response: HomeModels.GetSearchList.Response) {
        var cell = [HomeModels.Cell]()
        
        if !response.imageList.isEmpty {
            response.imageList.forEach { Data in
                cell.append(
                    .homeCell(
                        data: HomeModels.ImageModel(
                            title: Data.collectionName,
                            image: Data.artworkUrl100,
                            name: Data.artistName,
                            url: Data.artistViewURL,
                            description: Data.shortDescription,
                            price: Data.trackPrice?.description,
                            date: Data.releaseDate,
                            country: Data.country,
                            currency: Data.currency,
                            longDescription: Data.longDescription,
                            copyright: Data.copyright,
                            bigImage: Data.artworkUrl600,
                            primaryGenreName: Data.primaryGenreName
                        )
                    )
                )
            }
        } else {
            cell.append(.emptyResult)
        }
        
        viewController?.display(viewModel: HomeModels.GetSearchList.ViewModel(cell: cell))
    }
    
    func present(response: HomeModels.TapImage.Response) {
        viewController?.display(
            viewModel: HomeModels.TapImage.ViewModel(
                selecteImageData: response.selecteImageData
            )
        )
    }
}
