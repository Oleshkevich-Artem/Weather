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
    
    func delay(delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
             closure()
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
                .padding()
            
            TextField("Paris", text: $searchTerm)
                .padding()
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
            .padding()
            
            Button {
                cityViewModel.searchCurrentLocation()
                delay(delay: 0.5) {
                    searchTerm = cityViewModel.city
                }
                
            } label: {
                ZStack {
                    Circle().fill(Color.black)
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 40, height: 40)
            .padding(.trailing)

        }
        .foregroundColor(.white)
        .background(Color.black.opacity(0.3))
        .cornerRadius(20)
        .padding(.horizontal, 10)
    }
}
