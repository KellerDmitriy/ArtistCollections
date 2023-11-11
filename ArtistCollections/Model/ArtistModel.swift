//
//  ArtistModel.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import Foundation

struct ArtistResult: Codable {
    var artists: [ArtistModel]
}

struct ArtistModel: Codable, Comparable {
    let name: String
    let bio: String?
    let image: String?
    let works: [Work]?
    
    static func < (lhs: ArtistModel, rhs: ArtistModel) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: ArtistModel, rhs: ArtistModel) -> Bool {
        return lhs.name == rhs.name
    }
}

struct Work: Codable {
    let title: String
    let image: String?
    let info: String?
}
