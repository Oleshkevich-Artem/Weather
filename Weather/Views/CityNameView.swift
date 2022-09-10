//
//  CityNameView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 26.07.22.
//

import SwiftUI

struct CityNameView: View {
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 5) {
                Text(city)
                    .font(.system(.largeTitle))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1)
                
                Text(date)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 1)
            }
            .font(.system(.headline))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.4))
    }
}

