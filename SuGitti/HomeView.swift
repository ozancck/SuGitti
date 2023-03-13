//
//  HomeView.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var service = Service()

    var body: some View {
        NavigationStack {
            
            ZStack {
                LinearGradient(colors: [Color.cyan.opacity(0.7), Color.purple.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)

                Circle()
                    .frame(width: 300)
                    .foregroundColor(Color.blue.opacity(0.3))
                    .blur(radius: 10)
                    .offset(x: -100, y: -150)

                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .frame(width: 500, height: 500)
                    .foregroundStyle(LinearGradient(colors: [Color.purple.opacity(0.6), Color.mint.opacity(0.5)], startPoint: .top, endPoint: .leading))
                    .offset(x: 300)
                    .blur(radius: 30)
                    .rotationEffect(.degrees(30))

                Circle()
                    .frame(width: 450)
                    .foregroundStyle(Color.pink.opacity(0.6))
                    .blur(radius: 20)
                    .offset(x: 200, y: -200)

                VStack {
                    Text("Su Gitti")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 55)
                    ScrollView {
                        ForEach(service.shortaces, id: \.self) { element in
                            CellView(ilce: element.IlceAdi, aciklama: element.Aciklama, tarih: element.KesintiTarihi)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
