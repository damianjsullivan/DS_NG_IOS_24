//
//  BookDetailsViewModel.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 05/08/2024.
//

import Foundation
import SwiftUI

@Observable
class BookDetailsViewModel {
    var title: String = ""
    var authors: String = ""
    var description: String = ""
    var thumbnailURL: URL?
    
    private let book: Book
    
    init(book: Book) {
        self.book = book
        loadBookDetails()
    }
    
    private func loadBookDetails() {
        title = book.volumeInfo.title
        authors = book.volumeInfo.authors?.joined(separator: ", ") ?? "unknown"
        description = book.volumeInfo.volumeDescription ?? "No description available."
        
        if let thumbnail = book.volumeInfo.imageLinks?.thumbnail {
            thumbnailURL = URL(string: thumbnail)
        }
    }
}
