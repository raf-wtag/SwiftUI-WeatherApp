//
//  DailyWeather.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 20/5/21.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(max: 0.0, min: 0.0)
        weather = [WeatherDetail(main: "", description: "", icon: "")]
    }
}


extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
