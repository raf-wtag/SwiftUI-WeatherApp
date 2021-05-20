//
//  NetworkManager.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 20/5/21.
//

import Foundation

final class NetworkManager<T: Codable> {
    static func fetch(for url: URL, completion: @escaping (Result<T, NetworkError>) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("sdsdswds")
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(error: error!.localizedDescription)))
                return
            }
            
            guard let httpresponse = response as? HTTPURLResponse, httpresponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(weatherData))
            } catch let decodeError{
                print(String(describing: decodeError))
                completion(.failure(.decodingError(error: decodeError.localizedDescription)))
            }
            
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error (error: String)
    case decodingError(error: String)
}
