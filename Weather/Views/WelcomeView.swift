//
//  WelcomeView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 5.08.22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                LottieView(name: "welcomeMenuAnimation", loopMode: .loop)
                    .frame(width: 300, height: 300, alignment: .center)
                    .navigationBarTitleDisplayMode(.inline)
                
                VStack(spacing: 20) {
                    Text("Welcome!")
                        .bold().font(.title)
                        .foregroundColor(.black)
                
                    Text("Let's go to search weather for your city!")
                        .padding()
                        .foregroundColor(.black)
                }
                .multilineTextAlignment(.center)
                .padding()
                
                VStack(spacing: 30) {
                
                NavigationLink(destination: SearchCityView(), label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        Text("Search by city")
                            .bold()
                    }
                })
                .frame(width: 180)
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(30)
                }
                Spacer()
                
                Text("Created and Directed by")
                    .font(.footnote)
                    .foregroundColor(.black)
                Text("Artem Oleshkevich")
                    .bold()
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}
