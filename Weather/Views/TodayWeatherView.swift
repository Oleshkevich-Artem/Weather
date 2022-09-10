//
//  TodayWeatherView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var cityViewModel: CityViewViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text(NSLocalizedString("Today", comment: ""))
                .font(.largeTitle)
                .bold()
                .shadow(color: .black, radius: 1)
            
            HStack(spacing: 20) {
                LottieView(name: cityViewModel.getLottiesAnimationFor(icon: cityViewModel.weatherIcon))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(cityViewModel.temperature)℃")
                        .font(.system(size: 42))
                        .shadow(color: .black, radius: 1)
                    Text(NSLocalizedString(cityViewModel.conditions, comment: ""))
                        .shadow(color: .black, radius: 1)
                }
            }
        
            HStack {
                Spacer()
                widgetView(image: "wind", color: .gray, title: "\(cityViewModel.windSpeed)" + NSLocalizedString("Wind speed unit", comment: ""))
                Spacer()
                widgetView(image: "drop.fill", color: .cyan, title: "\(cityViewModel.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .yellow, title: "\(cityViewModel.rainChances)")
                Spacer()
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.cyan.opacity(0.5))
        .cornerRadius(30)
}
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack(alignment: .center) {
            Image(systemName: image)
                .padding()
                .font(.title)
                .frame(width: 70, height: 70)
                .foregroundColor(color)
                .background(Circle().fill(Color.white))
            
            Text(title)
        }
    }
}
