//
//  EndpointType.swift
//  RedditPhotoGallery
//
//  Created by cem sezeroglu on 15.04.2022.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}
