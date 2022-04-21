//
//  ListEntity.swift
//  iTunesSearchApp
//
//  Created by cem sezeroglu on 19.04.2022.
//

import Foundation

// MARK: - Welcome
struct ListEntity: Decodable {
    let resultCount: Int
    let results: [Result]?
}

// MARK: - Result
struct Result: Decodable {
    let wrapperType: String?
    let kind: String?
    let collectionID, trackID: Int?
    let artistName: String?
    let collectionName, trackName, collectionCensoredName, trackCensoredName: String?
    let collectionArtistID: Int?
    let collectionArtistViewURL, collectionViewURL, trackViewURL: String?
    let previewURL: String?
    let artworkUrl100: String?
    let collectionPrice: Float?
    let trackPrice, trackRentalPrice, collectionHDPrice, trackHDPrice: Float?
    let trackHDRentalPrice: Double?
    let releaseDate: String?
    let discCount, discNumber, trackCount, trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
    let longDescription: String?
    let hasITunesExtras: Bool?
    let shortDescription: String?
    let artistID: Int?
    let artistViewURL: String?
    let isStreamable: Bool?
    let copyright, resultDescription: String?
    let feedURL: String?
    let artworkUrl600: String?
    let genreIDS, genres: [String]?
}
