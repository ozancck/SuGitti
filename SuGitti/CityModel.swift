//
//  CityModel.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import Foundation

struct Shortaces: Decodable, Hashable {
    let kesintiTarihi, aciklama, ilceAdi: String
    let mahalleID: [Int]
    let mahalleler, tip, arizaGiderilmeTarihi: String
    let ilceID: Int
    let birim: String
    let arizaID: Int
    let arizaDurumu, guncellemeTarihi: String
    let arizaTipID: Int
    let kayitTarihi, kesintiSuresi, ongoru: String
}
