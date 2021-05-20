//
//  CItyNameView.swift
//  SwiftUI-WeatherApp
//
//  Created by Fahim Rahman on 20/5/21.
//

import SwiftUI

struct CityNameView: View {
    var cityName: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Text(cityName)
                    .font(.title)
                    .bold()
                Text(date)
            }
            .foregroundColor(.white)
        }
    }
}

struct CItyNameView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
