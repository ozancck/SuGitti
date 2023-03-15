//
//  DetailsViewModel.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 15.03.2023.
//

import Foundation

class DetailsViewModel: ObservableObject {
    func mahalleler(param: String) -> [String] {
        var result: [String] = []

        let str = param
        let arr = str.components(separatedBy: ",")
        result.append(contentsOf: arr)

        return result
    }

    func formatDate(_ dateString: String, fromFormat: String = "yyyy-MM-dd'T'HH:mm:ss", toFormat: String = "dd.MM.yyyy HH:mm") -> String? {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = fromFormat
        if let date = inputDateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = toFormat
            let formattedDateString = outputDateFormatter.string(from: date)
            return formattedDateString
        } else {
            return nil
        }
    }
    
    func formatDate(param: String)->Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: param)
        
        return date!
    }
}
