//
//  Service.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import Alamofire
import Foundation
import SwiftUI

class Service: ObservableObject {
    @Published var shortaces = [Shortaces]()
    
    init() {
           fetchShortaces()
       }

    func fetchShortaces() {
        AF.request("https://openapi.izmir.bel.tr/api/izsu/arizakaynaklisukesintileri", method: .get).responseDecodable(of: [Shortaces].self) { response in
            switch response.result {
            case let .success(data):

                self.shortaces = data
                
                print(self.shortaces)
                print("ananananan")

            case let .failure(error):
                print(error)
            }
        }
    }
}
