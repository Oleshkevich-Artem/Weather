//
//  DailyWeatherView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityViewModel: CityViewViewModel
    
    var body: some View {
        VStack {
            Text(NSLocalizedString("Daily weather", comment: ""))
                .bold().font(.title)
                .shadow(color: .black, radius: 1)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white.opacity(0.4))
                .foregroundColor(.white)
             
            
            ForEach(cityViewModel.weather.daily) { weather in
                LazyVStack {
                    getDailyCell(weather: weather)
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
    
    private func getDailyCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityViewModel.getDayFor(timestamp: weather.currentDate).uppercased())
                .frame(width: 50)
                .font(.system(.headline))
            
            Spacer()
            
            Text("\(cityViewModel.getTemperatureFor(temperature: weather.temperature.max)) | \(cityViewModel.getTemperatureFor(temperature: weather.temperature.min)) ℃")
                .font(.system(.headline))
            
            Spacer()
            cityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                .foregroundColor(.yellow)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.cyan.opacity(0.5)))
    }
}
