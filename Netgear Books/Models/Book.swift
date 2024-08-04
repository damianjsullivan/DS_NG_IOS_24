//
//  Book.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - Item
class Book: Codable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo?

    init(kind: String, id: String, etag: String, selfLink: String, volumeInfo: VolumeInfo, saleInfo: SaleInfo, accessInfo: AccessInfo, searchInfo: SearchInfo?) {
        self.kind = kind
        self.id = id
        self.etag = etag
        self.selfLink = selfLink
        self.volumeInfo = volumeInfo
        self.saleInfo = saleInfo
        self.accessInfo = accessInfo
        self.searchInfo = searchInfo
    }
    
    enum CodingKeys: String, CodingKey {
        case kind = "kind"
        case id = "id"
        case etag = "etag"
        case selfLink = "selfLink"
        case volumeInfo = "volumeInfo"
        case saleInfo = "saleInfo"
        case accessInfo = "accessInfo"
        case searchInfo = "searchInfo"
    }
}
