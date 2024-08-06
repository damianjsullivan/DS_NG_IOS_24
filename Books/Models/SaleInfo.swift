//
//  SaleInfo.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country: String
    let saleability: Saleability
    let isEbook: Bool
    let listPrice: SaleInfoListPrice?
    let retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?
}
