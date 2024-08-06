//
//  Book.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation
import SwiftData

// MARK: - Item
@Model
class Book: Identifiable, Codable {
    let kind: String
    @Attribute(.unique)
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.kind = try container.decode(String.self, forKey: .kind)
        self.id = try container.decode(String.self, forKey: .id)
        self.etag = try container.decode(String.self, forKey: .etag)
        self.selfLink = try container.decode(String.self, forKey: .selfLink)
        self.volumeInfo = try container.decode(VolumeInfo.self, forKey: .volumeInfo)
        self.saleInfo = try container.decode(SaleInfo.self, forKey: .saleInfo)
        self.accessInfo = try container.decode(AccessInfo.self, forKey: .accessInfo)
        self.searchInfo = try container.decodeIfPresent(SearchInfo.self, forKey: .searchInfo)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(kind, forKey: .kind)
        try container.encode(id, forKey: .id)
        try container.encode(etag, forKey: .etag)
        try container.encode(selfLink, forKey: .selfLink)
        try container.encode(volumeInfo, forKey: .volumeInfo)
        try container.encode(saleInfo, forKey: .saleInfo)
        try container.encode(accessInfo, forKey: .accessInfo)
        try container.encode(searchInfo, forKey: .searchInfo)
    }
    
}
