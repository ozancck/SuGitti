//
//  CountDownView.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 15.03.2023.
//

import SwiftUI

struct CountdownView: View {
    let targetDate: Date
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var remainingSeconds = 0
    var body: some View {
        VStack {
            Text("Arıza Süresi: \(timeLeft())")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width * 0.84)
        .padding()
        .background(Color("darkBlue"))
        .shadow(radius: 10)
        .cornerRadius(10)
        .onReceive(timer) { _ in

            let now = Date()
            remainingSeconds = Int(targetDate.timeIntervalSince(now))

            if remainingSeconds <= 0 {
                timer.upstream.connect().cancel()
            }
        }
    }

    func timeLeft() -> String {
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(targetDate: Date().addingTimeInterval(3600))
    }
}
