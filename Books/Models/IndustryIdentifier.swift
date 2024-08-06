//
//  IndustryIdentifier.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type: TypeEnum
    let identifier: String
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case identifier = "identifier"
    }
}
