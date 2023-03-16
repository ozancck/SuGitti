//
//  DetailsView.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 15.03.2023.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var detailModel = DetailsViewModel()
    @State var mahalleler: String
    @State var title: String
    @State var description: String
    @State var dateString: String
    @State var giderimleZamani: String
    @State var ilgiliAciklama: String

    var body: some View {
        let date = detailModel.formatDate(dateString)
        let arr = detailModel.mahalleler(param: mahalleler)

        ZStack{
            VStack(alignment: .center) {
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(arr, id: \.self) { element in
                                    Text(element.lowercased(with: Locale(identifier: "tr")))
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color.white)
                                        .foregroundColor(.black)
                                        .cornerRadius(20)
                                        .shadow(radius: 3)
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8)

                        if description != "" {
                            Text(description.lowercased(with: Locale(identifier: "tr")))
                                .font(.body)
                                .foregroundColor(.white)
                        } else {
                            Text("Herhangi bir aciklama yok")
                                .font(.body)
                                .foregroundColor(.white)
                        }
                        
                        VStack{
                            HStack{
                                Text(self.ilgiliAciklama.lowercased(with: Locale(identifier: "tr")))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .foregroundColor(.black)
                                    .italic()
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                            }
                        }
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(15)
                        

                        Divider()

                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.white)

                            Text(date!)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.8))
                .cornerRadius(20)

                .shadow(radius: 10)
                .padding(.horizontal)
                
                
                HStack {
                    CountdownView(targetDate: detailModel.formatDate(param: giderimleZamani))
                }
                
              
                
                Spacer()
            }
        }
       
       
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(mahalleler: "ankara, istanbul, edremit, bolu, sadas, adsas , ads", title: "izmir", description: "Ariza suresi yaklasik olarak cok surecektir. Siz iyisi mi su icmek yerine kola falan icin. Daha iyi gelir efenimmmm", dateString: "2023-03-15T13:00:00", giderimleZamani: "2023-03-15T13:00:00", ilgiliAciklama: "Detaylar gorusulecek")
    }
}
