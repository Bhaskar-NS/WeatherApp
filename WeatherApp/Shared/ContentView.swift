//
//  ContentView.swift
//  Shared
//
//  Created by Bhaskar on 06/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    var body: some View {
        ZStack {
            WeatherBackgroundView(isNight: $isNight)
            VStack {
                WeatherCityView(cityName: "Cupertino, CA")
                WeatherMainStatusView(imageName: isNight ? "moon.circle.fill" : "cloud.sun.fill",
                                      temperature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   temperature: 76,
                                   imageName: "cloud.sun.fill")
                    WeatherDayView(dayOfWeek: "WED",
                                   temperature: 60,
                                   imageName: "cloud.sun.rain.fill")
                    WeatherDayView(dayOfWeek: "THU",
                                   temperature: 55,
                                   imageName: "snowflake")
                    WeatherDayView(dayOfWeek: "FRI",
                                   temperature: 40,
                                   imageName: "wind.snow")
                    WeatherDayView(dayOfWeek: "SAT",
                                   temperature: 70,
                                   imageName: "cloud.sun.fill")
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  foregroundColor: Color.blue,
                                  backgroundColor: Color.white)
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
    var dayOfWeek: String
    var temperature: Int
    var imageName: String
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
            
        }
    }
}

struct WeatherBackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue , isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct WeatherCityView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 34, weight: .bold))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherMainStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(10.0)
    }
}
