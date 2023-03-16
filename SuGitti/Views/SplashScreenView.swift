//
//  SplashScreenView.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 16.03.2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("izmir")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 1.3)
            }
            .ignoresSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
