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
    private let dataManager: DataManagerProtocol

    init(bookService: BookServiceProtocol = BookService(), dataManager: DataManagerProtocol = DataManager()) {
        self.bookService = bookService
        self.dataManager = dataManager
    }
    
    func searchBooks() {
        // Display what we have locally
        fetchBooksLocally()
        // Search remotely
        Task {
            await fetchBooksRemotely()
        }
    }
    
    func fetchBooksLocally() {
        guard !searchQuery.isEmpty else {
            self.books = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let books = try dataManager.fetchBooks(query: searchQuery)
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
    
    func fetchBooksRemotely(completion: (()->())? = nil) async {
        guard !searchQuery.isEmpty else {
            self.books = []
            completion?()
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let books = try await bookService.fetchBooks(query: searchQuery)
            DispatchQueue.main.async {
                self.saveBooks(books)
                self.fetchBooksLocally()
                self.isLoading = false
                completion?()
            }
        } catch {
            DispatchQueue.main.async {
                Logger().error("\(error.localizedDescription, privacy: .public)")
                //self.errorMessage = "Something went wrong. Please try again."
                self.isLoading = false
                completion?()
            }
        }
    }
    
    func saveBooks(_ books: [Book]) {
        do {
            for book in books {
                try dataManager.saveBook(book)
            }
        } catch {
            Logger().error("\(error.localizedDescription, privacy: .public)")
            self.errorMessage = "Something went wrong. Please try again."
            self.isLoading = false
        }
    }
}
