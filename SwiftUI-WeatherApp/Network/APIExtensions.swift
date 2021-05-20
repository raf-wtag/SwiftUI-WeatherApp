//
//  APIExtensions.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 20/5/21.
//

import Foundation

extension OpenWeatherMapAPI {
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(latitude: Double, longitude: Double) -> String {
        return "\(baseURL)onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(apiKey)units=metric"
    }
}
