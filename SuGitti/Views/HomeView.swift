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
            NavigationStack{
                VStack {
                    List(service.shortaces, id: \.self) { element in
                        if element.IlceAdi != "" {
                            if searchText == "" {
                                // CellView(ilce: element.IlceAdi, aciklama: element.Aciklama, tarih: element.KayitTarihi)
                                NavigationLink {
                                    DetailsView(mahalleler: element.Mahalleler, title: element.IlceAdi, description: element.Aciklama, dateString: element.KesintiTarihi, giderimleZamani: element.ArizaGiderilmeTarihi, ilgiliAciklama: element.KesintiSuresi)
                                } label: {
                                    CellView(ilce: element.IlceAdi, mahalleler: element.Mahalleler)
                                }
                            } else {
                                if element.IlceAdi.lowercased().contains(searchText.lowercased()) || element.Mahalleler.lowercased().contains(searchText.lowercased()) {
                                    NavigationLink {
                                        DetailsView(mahalleler: element.Mahalleler, title: element.IlceAdi, description: element.Aciklama, dateString: element.KesintiTarihi, giderimleZamani: element.ArizaGiderilmeTarihi, ilgiliAciklama: element.KesintiSuresi)
                                    } label: {
                                        CellView(ilce: element.IlceAdi, mahalleler: element.Mahalleler)
                                    }
                                } else {
                                }
                            }
                        }else {
                            Text("AKTIF KESINTI BULUNAMADI!")
                                .font(.largeTitle)
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
            .accentColor(.black)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

