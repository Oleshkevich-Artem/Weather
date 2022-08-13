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
                    ZStack {
                        Circle().fill(Color.blue).frame(width: 120)
                        VStack {
            
                        Text("SEARCH")
                            .bold()
                            .font(.title)
                            
                        Image(systemName: "magnifyingglass")
                        }
                        .padding(.top, 10)
                    }
                })
                .foregroundColor(.white)
                }
                .padding(3)
                .background(Circle().fill(Color.cyan))
                               
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
