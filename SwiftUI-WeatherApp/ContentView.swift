//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 18/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("custom_lightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Dhaka, Bangladesh")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                    .padding(.bottom, 40)
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.bolt.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("36°")
                        .font(.system(size: 90, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayName: "SUN", weatherStatusImage: "cloud.heavyrain.fill", temperatureOfTheDay: 33)
                    WeatherDayView(dayName: "MON", weatherStatusImage: "wind", temperatureOfTheDay: 31)
                    WeatherDayView(dayName: "TUE", weatherStatusImage: "cloud.bolt.rain.fill", temperatureOfTheDay: 32)
                    WeatherDayView(dayName: "WED", weatherStatusImage: "sun.max.fill", temperatureOfTheDay: 38)
                    WeatherDayView(dayName: "THU", weatherStatusImage: "sun.haze.fill", temperatureOfTheDay: 37)
                }
                
                Spacer()
                
                Button {
                    print("Tapped")
                } label: {
                    Text("Change Time")
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(3.0)
                        
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
