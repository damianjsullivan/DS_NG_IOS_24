//
//  BookSearchViewModel.swift
//  Netgear Books
//
//  Created by Damian Sullivan on 05/08/2024.
//

import Foundation
import os

@Observable
class BookSearchViewModel {
    var searchQuery: String = ""
    var books: [Book] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let bookService: BookServiceProtocol

    init(bookService: BookServiceProtocol = BookService()) {
        self.bookService = bookService
    
    }
    
    func searchBooks() async {
        guard !searchQuery.isEmpty else {
            self.books = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let books = try await bookService.searchBooks(query: searchQuery)
            DispatchQueue.main.async {
                self.books = books
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                Logger().error("\(error.localizedDescription, privacy: .public)")
                self.errorMessage = "Something went wrong. Please try again."
                self.isLoading = false
            }
        }
    }
}
