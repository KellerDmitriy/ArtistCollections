//
//  NetworkManager.swift
//  ArtistCollections
//
//  Created by Келлер Дмитрий on 09.11.2023.
//

import UIKit

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchArtistsFromJSON(completion: @escaping (Result<ArtistResult, NetworkError>) -> Void) {
        guard let url = URL(string: "https://file.notion.so/f/f/b8bbfa88-ab7c-464e-8c0e-1c109af93066/8c0c0258-c23a-4229-ae76-b515867cc1d8/artists.json?id=65f3a8fb-a15e-48f4-a7ed-f75be1b2f4fb&table=block&spaceId=b8bbfa88-ab7c-464e-8c0e-1c109af93066&expirationTimestamp=1699819200000&signature=qPlr6SxCPZpW2fS7wFUQpV4_-TgQ1rnX6PgnO56w7Ys&downloadName=artists.json") else {
            completion(.failure(.invalidURL))
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let artists = try JSONDecoder().decode(ArtistResult.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(artists))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
