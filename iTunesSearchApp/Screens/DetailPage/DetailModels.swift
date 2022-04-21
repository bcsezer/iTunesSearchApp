//
//  DetailModels.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 20.04.2022.
//

import Foundation

enum DetailModels {
    
    struct DetailModel {
        let title: String?
        let image: String?
        let name: String?
        let url: String?
        let description: String?
        let price: String?
        let date: String?
        let country: String?
        let currency: String?
        let longDescription: String?
        let copyright: String?
        let bigImage: String?
        let primaryGenreName: String?
        let isImageAvailable: Bool
        let isDescAvailable: Bool
    }
    
    enum GetDetail {
        struct Request {
        }
        struct Response {
            let data: HomeModels.ImageModel
        }
        struct ViewModel {
            let data: DetailModel
        }
    }
}
