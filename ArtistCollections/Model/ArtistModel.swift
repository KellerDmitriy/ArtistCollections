//
//  ArtistModel.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import Foundation

struct ArtistResult: Codable {
    let artists: [ArtistModel]
}

struct ArtistModel: Codable {
    let name: String
    let bio: String?
    let image: String?
    let work: [Works]?
}

struct Works: Codable {
    let title: String
    let image: String?
    let info: String?
}
