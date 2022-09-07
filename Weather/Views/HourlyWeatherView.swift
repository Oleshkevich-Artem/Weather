//
//  HourlyWeatherView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var cityViewModel: CityViewViewModel
    
    var body: some View {
        VStack {
            Text(NSLocalizedString("Hourly weather", comment: ""))
                .bold().font(.title)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.opacity(0.4))
             
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(cityViewModel.weather.hourly) { weather in
                        let icon = cityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                        
                        let hour = cityViewModel.getTimeFor(timestamp: weather.currentDate)
                        let temperature = cityViewModel.getTemperatureFor(temperature: weather.temperature)
                        getHourlyView(hour: hour, image: icon, temperature: temperature)
                    }
                }
            }
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temperature: String) -> some View {
        VStack(spacing: 5) {
            Text(NSLocalizedString(hour, comment: ""))
                .font(.system(.headline))
            image
                .foregroundColor(.yellow)
            Text("\(temperature) ℃")
                .font(.system(.headline))
        }
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.cyan.opacity(0.5)))
    }
}
