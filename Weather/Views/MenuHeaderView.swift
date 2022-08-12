//
//  MenuHeaderView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityViewModel: CityViewViewModel
    
    @State private var searchTerm = "Paris"
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding(10)
            
            TextField("Paris", text: $searchTerm)
                .padding(10)
                .font(.system(.headline))
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(20)
            
            Button {
                cityViewModel.city = searchTerm
            } label: {
                ZStack {
                    Circle().fill(Color.cyan)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 40, height: 40)
            .padding(10)
            
            Button {
                cityViewModel.searchCurrentLocation()
                if let location = cityViewModel.currentLocation?.name {
                    cityViewModel.city = location
                    searchTerm = cityViewModel.city
                }
                
                    
            } label: {
                ZStack {
                    Circle().fill(Color.cyan)
                    Image(systemName: "paperplane.circle.fill")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 40, height: 40)
            .padding(10)
        }
        .foregroundColor(.white)
        .background(Color.black.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 10)
    }
}
