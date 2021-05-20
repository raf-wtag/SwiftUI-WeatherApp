//
//  CityViewViewModel.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 20/5/21.
//

import SwiftUI
import CoreLocation

final class CityViewViewModel: ObservableObject {
    @Published var weather = WeatherResponse.populateEmptyList()
    @Published var cityName = "Rangpur" {
        didSet {
            
        }
    }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    init() {
        
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "thermometer"
    }
    
    var temperature: String {
        return getTemperature(for: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.1f%%", weather.current.dew_point)
    }
    
    func getTemperature(for temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    private func getLocationCoordinates() {
        CLGeocoder().geocodeAddressString(cityName) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.prepareToGetWeatherForecasts(for: place.location?.coordinate)
            }
        }
    }
    
    private func prepareToGetWeatherForecasts(for coordinates: CLLocationCoordinate2D?) {
        var urlString: String = ""
        if let coordinates = coordinates {
            urlString = OpenWeatherMapAPI.getURLFor(latitude: coordinates.latitude, longitude: coordinates.longitude)
        } else {
            urlString = OpenWeatherMapAPI.getURLFor(latitude: 24.098379, longitude: 90.328712)
        }
        getWeatherForecast(city: cityName, for: urlString)
    }
    
    private func getWeatherForecast(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getLottieAnimation(for icon: String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
        case "04d":
            return "dayBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
        case "09d":
            return "dayShowerRains"
        case "09n":
            return "nightShowerRains"
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
        case "11d":
            return "dayThunderstrom"
        case "11n":
            return "nightThunderstrom"
        case "13d":
            return "dayClearSky"
        case "13n":
            return "nightClearSky"
        case "50d":
            return "dayMist"
        case "50n":
            return "nightMist"
        default:
            return "dayClearSky"
        }
    }
    
    func getWeatherIcon(for icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill")
        case "01n":
            return Image(systemName: "moon.fill")
        case "02d":
            return Image(systemName: "clouds.sun.fill")
        case "02n":
            return Image(systemName: "clouds.moon.fill")
        case "03d":
            return Image(systemName: "cloud.fill")
        case "03n":
            return Image(systemName: "cloud.fill")
        case "04d":
            return Image(systemName: "cloud.fill")
        case "04n":
            return Image(systemName: "cloud.fill")
        case "09d":
            return Image(systemName: "cloud.drizzle.fill")
        case "09n":
            return Image(systemName: "cloud.drizzle.fill")
        case "10d":
            return Image(systemName: "cloud.heavyrain.fill")
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill")
        case "11d":
            return Image(systemName: "cloud.bolt.fill")
        case "11n":
            return Image(systemName: "cloud.bolt.fill")
        case "13d":
            return Image(systemName: "cloud.snow.fill")
        case "13n":
            return Image(systemName: "cloud.snow.fill")
        case "50d":
            return Image(systemName: "cloud.fog.fill")
        case "50n":
            return Image(systemName: "cloud.fog.fill")
        default:
            return Image(systemName: "thermometer")
        }
    }
}
