//
//  Welcome.swift
//  SuGitti
//
//  Created by Ozan Çiçek on 14.03.2023.
//

import Foundation

struct Welcome: Codable {
    let data: [Datum]
}

// MARK: - Datum

struct Datum: Codable {
    let latitude, longitude: Double
    let type, name, number, postalCode: String
    let street: String
    let confidence: Int
    let region, regionCode, county, locality: String
    let administrativeArea: JSONNull?
    let neighbourhood, country, countryCode, continent: String
    let label: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
