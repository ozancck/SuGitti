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

    var body: some View {
        HStack {
            Image(systemName: "drop.degreesign.slash.fill")
                .foregroundColor(.red)
                .padding(.trailing)
                .font(.title2)
            VStack(alignment: .leading) {
                Text(ilce)
                    .bold()

                Text(mahalleler.lowercased(with: Locale(identifier: "tr")))
                    .font(.caption)
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(ilce: "Dikili", mahalleler: "ankara ankara ankara ")
    }
}
