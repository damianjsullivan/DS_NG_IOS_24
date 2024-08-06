//
//  AccessInfo.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: String
    let viewability: Viewability
    let embeddable: Bool
    let publicDomain: Bool
    let textToSpeechPermission: TextToSpeechPermission
    let epub: Epub
    let pdf: Epub
    let webReaderLink: String
    let accessViewStatus: AccessViewStatus
    let quoteSharingAllowed: Bool
}
