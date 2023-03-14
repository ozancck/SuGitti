//
//  CellView.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import SwiftUI

struct CellView: View {
    @State var ilce: String
    @State var aciklama: String
    @State var tarih: String

    var body: some View {
//        VStack(alignment: .leading) {
//            VStack(alignment: .leading) {
//                Text(ilce.uppercased())
//                    .font(.headline)
//                    .padding(.horizontal)
//                    .padding(.top)
//                Text(aciklama.lowercased())
//                    .padding(.horizontal)
//                    .padding(.top, 0.1)
//
//
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text("Kesinti Tarihi:")
//                            .bold()
//                            .padding(.bottom, 1)
//
//                        Text(tarih)
//                    }
//
//                }.padding(.top, 0.1)
//                    .padding(.leading)
//                    .padding(.bottom)
//            }
//            .frame(width: UIScreen.main.bounds.width * 0.9)
//            .foregroundColor(Color.black.opacity(0.8))
//            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
//        }

        VStack {
            Text(ilce)
                .bold()
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.06)
        .foregroundColor(Color.black.opacity(0.8))
        .background(in: RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(ilce: "Dikili", aciklama: "ankara ankara ankara ankara ankara ankara ankara ankara ankara ankara ankara ", tarih: "121212")
         
    }
}
