//
//  LoadingView.swift
//  Weather
//
//  Created by Oleshkevich Artem on 5.08.22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(alignment: .center) {
            LottieView(name: "loadingAnimation", loopMode: .loop)
        }
    }
}
