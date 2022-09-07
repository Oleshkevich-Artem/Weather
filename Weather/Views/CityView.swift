//
//  CityView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var cityViewModel: CityViewViewModel
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city, date: cityViewModel.date)
            TodayWeatherView(cityViewModel: cityViewModel)
                .padding(.horizontal)
            HourlyWeatherView(cityViewModel: cityViewModel)
            DailyWeatherView(cityViewModel: cityViewModel)
        }
        .padding(.bottom, 30)
        
    }
}
