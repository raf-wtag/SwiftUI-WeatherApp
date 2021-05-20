//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 18/5/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cityVM = CityViewViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                MenuHeaderView(cityVM: cityVM)
                    .padding()
                ScrollView(showsIndicators: true) {
                    CityView(cityVM: cityVM)
                }
                .padding(.top, 10)
            }
            .padding(.top, 50)
        }
        .background(RoundedRectangle(cornerRadius: 5).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

