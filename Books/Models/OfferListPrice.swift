//
//  OfferListPrice.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - OfferListPrice
struct OfferListPrice: Codable {
    let amountInMicros: Int
    let currencyCode: String
}
