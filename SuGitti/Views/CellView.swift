//
//  CellView.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import SwiftUI

struct CellView: View {
    @State var ilce: String
    @State var mahalleler: String
    @State var durum: String

    var body: some View {
        HStack {
            Image(systemName: "drop.degreesign.slash.fill")
                .foregroundColor(durum == "1" ? .blue : .red)
                .padding(.trailing)
                .font(.title2)
            VStack(alignment: .leading) {
                Text(ilce)
                    .bold()

                Text(mahalleler)
                    .font(.caption)
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(ilce: "Dikili", mahalleler: "ankara ankara ankara ", durum: "1")
    }
}
