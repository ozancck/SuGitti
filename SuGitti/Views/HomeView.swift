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
            HStack {
                Text("Izmir")
                    .font(.largeTitle)
                    .bold()
            }
            VStack {
                List {
                    ForEach(service.shortaces, id: \.self) { element in
                        // CellView(ilce: element.IlceAdi, aciklama: element.Aciklama, tarih: element.KayitTarihi)
                        NavigationLink {
                        } label: {
                            HStack {
                                Image(systemName: "drop.degreesign.slash.fill")
                                    .foregroundColor(element.ArizaDurumu == "1" ? .blue : .red)
                                    .padding(.trailing)
                                    .font(.title2)
                                VStack(alignment: .leading) {
                                    Text(element.IlceAdi)
                                        .bold()
                                  

                                    Text(element.Mahalleler)
                                        .font(.caption)
                                }
                            }
                        }
                    }
                }
                HStack {
                    HStack {
                        HStack {
                            Image(systemName: "drop.degreesign.slash.fill")
                                .foregroundColor(.blue)

                            Text("Giderildi ")
                                .bold()

                        }.padding(.bottom, 1)

                        HStack {
                            Image(systemName: "drop.degreesign.slash.fill")
                                .foregroundColor(.red)

                            Text("Devam Ediyor")
                                .bold()
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
