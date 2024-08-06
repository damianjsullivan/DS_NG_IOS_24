//
//  Offer.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - Offer
struct Offer: Codable {
    let finskyOfferType: Int
    let listPrice: OfferListPrice
    let retailPrice: OfferListPrice
}
