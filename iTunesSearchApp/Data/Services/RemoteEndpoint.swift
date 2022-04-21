//
//  RemoteEndpoint.swift
//  RedditPhotoGallery
//
//  Created by cem sezeroglu on 15.04.2022.
//

import Foundation

enum RemoteEndpoint {
    case getList(keyword: String, limit: Int)
}

extension RemoteEndpoint: EndpointType {
    var baseURL: URL {
        guard let url = URL(string: Urls.baseUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getList:
            return Urls.path
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getList:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getList(let term, let limit):
            return .requestParameters(
                bodyEncoding: .urlEncoding,
                urlParameters: ["limit": limit,
                                "term": term
                               ]
            )
        }
    }
}
