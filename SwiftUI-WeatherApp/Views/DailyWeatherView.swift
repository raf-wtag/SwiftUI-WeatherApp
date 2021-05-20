//
//  DailyWeatherView.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 20/5/21.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            LazyVStack {
                dailyCell(weather: weather)
            }
        }
    }
    private func dailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
                .frame(width: 50)
            Spacer()
            Text("\(cityVM.getTemperature(for: weather.temp.max))°C | \(cityVM.getTemperature(for: weather.temp.min))°C")
            Spacer()
            cityVM.getWeatherIcon(for: weather.weather.count > 0 ? weather.weather[0].icon : "thermometer")
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
