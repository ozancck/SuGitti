//
//  Service.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 13.03.2023.
//

import Foundation
import SwiftUI

class Service: ObservableObject {
    
    @Published var shortaces: [Shortaces] = []

    func fetchShortaces() {
        let task = URLSession.shared.dataTask(with: URL(string: "https://openapi.izmir.bel.tr/api/izsu/arizakaynaklisukesintileri")!) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let shortaces = try JSONDecoder().decode(Shortaces.self, from: data)
                DispatchQueue.main.async {
                    self?.shortaces = [shortaces]
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }
}
