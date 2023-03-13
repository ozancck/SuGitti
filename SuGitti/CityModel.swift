//
//  CityModel.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import Foundation

struct Shortaces: Codable, Hashable {
    let KesintiTarihi, Aciklama, IlceAdi: String
    let MahalleID: [Int]
    let Mahalleler, Tip, ArizaGiderilmeTarihi: String
    let IlceID: Int
    let Birim: String
    let ArizaID: Int
    let ArizaDurumu, GuncellemeTarihi: String
    let ArizaTipID: Int
    let KayitTarihi, KesintiSuresi, Ongoru: String
}
