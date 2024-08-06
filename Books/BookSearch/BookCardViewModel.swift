//
//  BookCardViewModel.swift
//  Books
//
//  Created by Damian Sullivan on 06/08/2024.
//

import Foundation
import SwiftUI

@Observable
class BookCardViewModel {
    var title: String = ""
    var authors: String = ""
    var thumbnailURL: URL?
    
    private let book: Book
    
    init(book: Book) {
        self.book = book
        loadBookDetails()
    }
    
    private func loadBookDetails() {
        title = book.volumeInfo.title
        authors = book.volumeInfo.authors?.joined(separator: ", ") ?? "unknown"
        
        if let thumbnail = book.volumeInfo.imageLinks?.thumbnail {
            thumbnailURL = URL(string: thumbnail)
        }
    }
}
