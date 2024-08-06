//
//  VolumeInfo.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 04/08/2024.
//

import Foundation

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]?
    let publishedDate: String?
    let readingModes: ReadingModes
    let pageCount: Int?
    let printType: PrintType
    let maturityRating: MaturityRating
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary?
    let imageLinks: ImageLinks?
    let language: String
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let subtitle: String?
    let publisher: String?
    let volumeDescription: String?
    let industryIdentifiers: [IndustryIdentifier]?
    let categories: [String]?
    let averageRating: Double?
    let ratingsCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case authors = "authors"
        case publishedDate = "publishedDate"
        case readingModes = "readingModes"
        case pageCount = "pageCount"
        case printType = "printType"
        case maturityRating = "maturityRating"
        case allowAnonLogging = "allowAnonLogging"
        case contentVersion = "contentVersion"
        case panelizationSummary = "panelizationSummary"
        case imageLinks = "imageLinks"
        case language = "language"
        case previewLink = "previewLink"
        case infoLink = "infoLink"
        case canonicalVolumeLink = "canonicalVolumeLink"
        case subtitle = "subtitle"
        case publisher = "publisher"
        case volumeDescription = "description"
        case industryIdentifiers = "industryIdentifiers"
        case categories = "categories"
        case averageRating = "averageRating"
        case ratingsCount = "ratingsCount"
    }
}
