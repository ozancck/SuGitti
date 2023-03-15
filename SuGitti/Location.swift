//
//  Location.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 14.03.2023.
//

import Foundation

class Function: ObservableObject {
    class Function: ObservableObject {
        
        @Published var welcome: [Datum] = []

        func getLocation(param: String) {
            let accessKey = "4fc63569b5ab79d7d379f794a29fc80f"
            let query = param
            let region = "Izmir"
            let output = "json"
            let limit = 1

            let queryString = [
                "access_key": accessKey,
                "query": query,
                "region": region,
                "output": output,
                "limit": String(limit),
            ].map { "\($0)=\($1)" }.joined(separator: "&")

            let urlString = "https://api.positionstack.com/v1/forward?" + queryString
            let url = URL(string: urlString)!

            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    print(error?.localizedDescription ?? "Unknown error")
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Welcome.self, from: data)
                    DispatchQueue.main.async {
                        self.welcome = response.data
                    }
                } catch {
                    print("Failed to decode JSON response: \(error.localizedDescription)")
                }
            }

            task.resume()
        }
    }

    struct Datum: Codable {
        // Define your properties here
    }

    struct Welcome: Codable {
        let data: [Datum]
    }
}
