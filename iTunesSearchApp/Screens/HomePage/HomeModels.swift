//
//  HomeModels.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import Foundation

enum HomeModels {
    
    struct ImageModel {
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
    }
    
    // MARK: Use Cases
    
    enum GetSearchList {
        struct Request {
            let keyword: String?
        }
        struct Response {
            let imageList: [Result]
        }
        struct ViewModel {
            let cell: [Cell]
        }
    }
    
    enum ScrollToBottom {
        struct Request {
        }
        struct Response {
            
        }
        struct ViewModel {
        }
    }
    
    enum TapImage {
        struct Request {
            let selecteImageData: ImageModel
        }
        struct Response {
            let selecteImageData: ImageModel
        }
        struct ViewModel {
            let selecteImageData: ImageModel
        }
    }
    
    enum Cell {
        case homeCell(data: ImageModel)
        case emptyResult
        
        func identifier() -> String {
            switch self {
            case .homeCell:
                return HomeCell.identifier
            case .emptyResult:
                return EmptyCell.identifier
            }
        }
        
    }
}
