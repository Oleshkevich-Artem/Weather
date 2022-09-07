//
//  ContentView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 21.07.22.
//

import SwiftUI

struct SearchCityView: View {
    @ObservedObject var cityViewModel = CityViewViewModel()
    
    var body: some View {
        VStack {
            MenuHeaderView(cityViewModel: cityViewModel)
            if cityViewModel.loading {
                LoadingView()
            }
            else {
                ScrollView(showsIndicators: false) {
                    CityView(cityViewModel: cityViewModel)
                }
            }
        }
        .background(Image("clouds"))
        .padding(.top, 5)
    }
}
