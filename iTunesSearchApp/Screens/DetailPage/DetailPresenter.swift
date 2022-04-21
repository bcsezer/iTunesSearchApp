//
//  DetailPresenter.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 20.04.2022.
//

import Foundation

protocol DetailPagePresentationLogic {
    func present(response: DetailModels.GetDetail.Response)
}

class DetailPresenter: DetailPagePresentationLogic {
    
    var viewController: DetailPageDisplayLogic?
    
    func present(response: DetailModels.GetDetail.Response) {
        var isImageAvailable: Bool = true
        var isDescAvailable: Bool = true
        
        let dateConverter = DateFormatter()
        dateConverter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let stringToDate = dateConverter.date(from: response.data.date ?? "") ?? Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyy"

        
        viewController?.display(
            viewModel: DetailModels.GetDetail.ViewModel(
                data: DetailModels.DetailModel(
                    title: response.data.title,
                    image: response.data.image,
                    name: response.data.name,
                    url: response.data.url,
                    description: "",
                    price: "\(response.data.price ?? "") \(response.data.currency ?? "")",
                    date: dateFormatter.string(from: stringToDate),
                    country: response.data.country,
                    currency: response.data.currency,
                    longDescription: response.data.longDescription,
                    copyright: response.data.copyright,
                    bigImage: response.data.bigImage,
                    primaryGenreName: response.data.primaryGenreName,
                    isImageAvailable: response.data.bigImage != nil,
                    isDescAvailable: response.data.longDescription != nil
                )
            )
        )
    }
}
