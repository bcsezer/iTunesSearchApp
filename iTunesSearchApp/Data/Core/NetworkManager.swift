//
//  NetworkManager.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import Foundation

struct NetworkManager {
    static let shared = NetworkManager()
    
    let provider = NetworkProvider<RemoteEndpoint>()
    
    func getList(keyword: String?, limit: Int, completion: @escaping ClosureType<ListEntity>, failure: @escaping Failure) {
        provider.request(
            .getList(keyword: keyword ?? "",
                     limit: limit),
            model: ListEntity.self,
            completion: completion,
            failure: failure
        )
    }
}
