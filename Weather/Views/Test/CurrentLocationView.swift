//
//  CurrentLocationView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 5.08.22.
//

import SwiftUI
import CoreLocationUI

struct CurrentLocationView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                LottieView(name: "locationAnimation", loopMode: .loop)
                    .frame(width: 300, height: 300)
                Text("Please share your current location!")
                    .bold().font(.title)
                
                Text("This is necessary to determine your location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
