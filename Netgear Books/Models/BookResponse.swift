//
//  BookResponse.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - BookResponse
struct BookResponse: Codable {
    let kind: String
    let totalItems: Int
    let items: [Book]
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case totalItems = "totalItems"
        case items = "items"
    }
}
