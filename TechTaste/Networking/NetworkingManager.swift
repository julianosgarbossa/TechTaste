//
//  NetworkingManager.swift
//  TechTaste
//
//  Created by Juliano Sgarbossa on 30/06/25.
//

import Foundation

enum NetworkingError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkingManager {
    func getProductsList(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: "https://my-json-server.typicode.com/alura-cursos/techtaste-api/products") else {
            completion(.failure(NetworkingError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NetworkingError.invalidResponse))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkingError.invalidData))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(NetworkingError.decodingError))
                return
            }
        }
        task.resume()
    }
}
