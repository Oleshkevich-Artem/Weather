//
//  CurrentLocationDataView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 5.08.22.
//

import SwiftUI

struct ShareLocationView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("\(location.longitude), \(location.latitude)")
                    .background(Color.red)
                    .foregroundColor(Color.white)
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    CurrentLocationView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(.white)
        }
}
