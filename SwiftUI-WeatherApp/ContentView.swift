//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 18/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
                CitynameTextView(cityName: "Dhaka, Bangladesh")
                
                PresentdayWeather(weatherStatusImage: isNight ? "cloud.moon.bolt.fill" : "cloud.sun.bolt.fill", temperature: 36)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayName: "SUN", weatherStatusImage: "cloud.heavyrain.fill", temperatureOfTheDay: 33)
                    WeatherDayView(dayName: "MON", weatherStatusImage: "wind", temperatureOfTheDay: 31)
                    WeatherDayView(dayName: "TUE", weatherStatusImage: "cloud.bolt.rain.fill", temperatureOfTheDay: 32)
                    WeatherDayView(dayName: "WED", weatherStatusImage: "sun.max.fill", temperatureOfTheDay: 38)
                    WeatherDayView(dayName: "THU", weatherStatusImage: "sun.haze.fill", temperatureOfTheDay: 37)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    StatusChangeButton(buttonTitle: "Change Shift", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayName: String
    var weatherStatusImage: String
    var temperatureOfTheDay: Int
    
    var body: some View {
        VStack {
            Text(dayName)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Image(systemName: weatherStatusImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperatureOfTheDay)°")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("custom_lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CitynameTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
            .padding(.bottom, 40)
    }
}

struct PresentdayWeather: View {
    
    var weatherStatusImage: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weatherStatusImage)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 90, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct StatusChangeButton: View {
    
    var buttonTitle: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonTitle)
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(3.0)
    }
}
