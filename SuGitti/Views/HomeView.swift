//
//  HomeView.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var service = Service()
    @State private var searchText = ""

    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    List(service.shortaces, id: \.self) { element in
                        if searchText == "" {
                            // CellView(ilce: element.IlceAdi, aciklama: element.Aciklama, tarih: element.KayitTarihi)
                            NavigationLink {
                            } label: {
                                HStack {
                                    Image(systemName: "drop.degreesign.slash.fill")
                                        .foregroundColor(.red)
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
                        } else {
                            if element.IlceAdi.lowercased().contains(searchText.lowercased()) || element.Mahalleler.lowercased().contains(searchText.lowercased()) {
                                NavigationLink {
                                } label: {
                                    HStack {
                                        Image(systemName: "drop.degreesign.slash.fill")
                                            .foregroundColor(.red)
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
                            } else {
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Look for something")
                    .refreshable {
                        service.fetchShortaces()
                    }
                    .navigationTitle("Aktif Kesintiler")

                    VStack(alignment: .center) {
                        NavigationLink {
                        } label: {
                            HStack {
                                Image(systemName: "location")
                                Text("Konum: Izmir")
                                    .bold()
                                    .font(.caption)
                            }
                        }
                        .foregroundColor(.black)
                    }
                    .padding()
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity
                    )
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
