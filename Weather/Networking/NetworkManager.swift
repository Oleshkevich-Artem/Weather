//
//  NetworkManager.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import Foundation

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL, complition: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(String(describing: error!))
                complition(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                complition(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complition(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                complition(.success(json))
            }
            catch let err {
                print(String(describing: err))
                complition(.failure(.decodingError(err: err.localizedDescription)))
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
    
}
